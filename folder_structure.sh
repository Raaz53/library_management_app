#!/bin/bash
projectName="book_hive"
# Check if project name is provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a feature name as an argument."
  exit 1
fi

#package:${projectName}/features/

directory="lib/features"
packageName=""

if [[ -n "$1" ]]; then
  if [[ "$1" == "account" || "$1" == "admin" ]]; then
    echo "
    ########################
    This is a feature folder that you cannot use as a feature.
    ########################"
    exit 1
  fi
fi

if [[ -z "$2" ]]; then
  cd $directory
else
  if [[ "$2" != "account" && "$2" != "admin" ]]; then
    echo "
    ########################
    The feature folder has not been created yet. Please create it before attempting to use it.
    ########################"
    exit 1
  fi
  packageName="$2/"
  tempDirectory="$directory/$2"
  if [[ -d "$tempDirectory" ]]; then
    #Folder Exists
    directory=$tempDirectory
    cd $directory
  else
    #Folder not Exists
    mkdir -p $tempDirectory
    directory=$tempDirectory
    cd $directory
  fi
fi


echo "
#######################################
Change Directory to lib/features
#######################################
"

#Convert the featurename to lower case
featureName=$1

echo "Feature name : $featureName"

#Convert the featurename to snakecase
fileName="$(echo "$featureName" | sed 's/\([a-z0-9]\)\([A-Z]\)/\1_\2/g' | tr '[:upper:]' '[:lower:]')"

echo "Feature file name : $fileName"

# Split the string into an array of words using the underscore as a delimiter
IFS='_' read -ra words <<< "$fileName"

# Loop through the array and capitalize the first letter of each word,
# including the first word
modelName=""
for i in "${!words[@]}"; do
  modelName+="$(echo "${words[i]:0:1}" | tr '[:lower:]' '[:upper:]')"
  modelName+="${words[i]:1}"
done
echo "Feature Model: $modelName"

# output the model instance
# first letter first word small case other words capital case
modelInstance=""
for i in "${!words[@]}"; do
  if [ "$i" -eq 0 ]; then
    modelInstance+="${words[i]}"
  else
    modelInstance+="$(echo "${words[i]:0:1}" | tr '[:lower:]' '[:upper:]')"
    modelInstance+="${words[i]:1}"
  fi
done
echo "Feature Instance: $modelInstance"

if [[ -d "$featureName" ]]; then
  echo "
  #######################################
  $featureName already exists and cannot be created again.
  #######################################
  "
  exit 1
fi

mkdir $featureName

# Navigate to the project directory
cd $featureName


# Create data directory
mkdir data

# Create domain directory
mkdir domain

# Create presentation directory
mkdir presentation




# Create data directory structure
mkdir -p data/datasources
mkdir -p data/models
mkdir -p data/repositories

# Create domain directory structure
mkdir -p domain/entities
mkdir -p domain/repositories

# Create presentation directory structure
mkdir -p presentation/cubit
mkdir -p presentation/screens
mkdir -p presentation/widgets


echo "
#######################################
Switch to data layer
#######################################
"

################# RemoteData Source for feature -> data/datasources/${fileName}_remote_data_source.dart ###################
echo "Creating remote data source for ${feature}"
echo "import 'package:injectable/injectable.dart';
import 'package:${projectName}/core/clients/rest_client/authorized_api_client/authorized_api_client.dart';
import 'package:${projectName}/core/exceptions/exception_handler.dart';
import 'package:${projectName}/core/models/response_data.dart';
import 'package:${projectName}/core/models/response_wrapper.dart';

import 'package:${projectName}/features/${packageName}${featureName}/data/models/${fileName}_model.dart';

abstract class ${modelName}RemoteDataSource {
    Future<ResponseWrapper<ResponseData<${modelName}Model>>> get${modelName}();
 }
  
 @LazySingleton(as: ${modelName}RemoteDataSource)
 class ${modelName}RemoteDataSourceImpl extends ${modelName}RemoteDataSource {
  final AuthorizedApiClient authorizedApiClient;

  ${modelName}RemoteDataSourceImpl(this.authorizedApiClient);

  @override
  Future<ResponseWrapper<ResponseData<${modelName}Model>>> get${modelName}() async {
    try {
     throw UnimplementedError();
    //  return await authorizedApiClient.get${modelName}();
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}" > "data/datasources/${fileName}_remote_data_source.dart"

################# Models for feature -> data/models/${fileName}_model.dart ###################

echo "
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:${projectName}/features/${packageName}${featureName}/domain/entities/${fileName}_entity.dart';

part '${fileName}_model.freezed.dart';
part '${fileName}_model.g.dart';

@freezed
class ${modelName}Model with _$"${modelName}Model" {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ${modelName}Model({
    required int id,
    
  }) = _${modelName}Model;

  factory ${modelName}Model.fromJson(Map<String, Object?> json) =>
      _$"${modelName}Model"FromJson(json);

 // This will be implemented in all concrete classes generated by Freezed  
  const ${modelName}Model._(); 
  
   ${modelName}Entity asEntity() => ${modelName}Entity(
        id: id,
    );

}" > "data/models/${fileName}_model.dart"


################# Repository Implementation for feature -> data/repositories/${fileName}_repository_impl.dart ###################

echo "import 'package:injectable/injectable.dart';
import 'package:${projectName}/core/resource/resource.dart';
import 'package:${projectName}/core/exceptions/exception_handler.dart';
import 'package:${projectName}/features/${packageName}${featureName}/data/datasources/${fileName}_remote_data_source.dart';
import 'package:${projectName}/features/${packageName}${featureName}/domain/repositories/${fileName}_repository.dart';
import 'package:${projectName}/features/${packageName}${featureName}/data/models/${fileName}_model.dart';

@LazySingleton(as: ${modelName}Repository)
class ${modelName}RepositoryImpl extends ${modelName}Repository {
 final ${modelName}RemoteDataSource remoteDataSource;

  ${modelName}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<${modelName}Model>> get${modelName}() async {
    try {
      final response = await remoteDataSource.get${modelName}();
      return Result.success(response.data.data.data);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}" > "data/repositories/${fileName}_repository_impl.dart"



echo "
#######################################
Switch to domain layer
#######################################
"

################# Entities for feature -> domain/entities/${fileName}_entity.dart ###################

echo "class ${modelName}Entity {
  const ${modelName}Entity({
    required this.id
  });

  final int id;
}" > "domain/entities/${fileName}_entity.dart"


################# Repositories for feature -> domain/repositories/${fileName}_repository.dart ###################

echo "import 'package:${projectName}/core/resource/resource.dart';
import 'package:${projectName}/features/${packageName}${featureName}/data/models/${fileName}_model.dart';

abstract class ${modelName}Repository {
  Future<Result<${modelName}Model>> get${modelName}();
}" > "domain/repositories/${fileName}_repository.dart"


echo "
#######################################
Switch to presentation layer
#######################################
"

################# Cubit for feature -> presentation/cubit/${fileName}_provider.dart ###################

echo "import 'package:injectable/injectable.dart';
import 'package:${projectName}/core/exceptions/exception_handler.dart';
import 'package:${projectName}/features/${packageName}${featureName}/data/models/${fileName}_model.dart';
import 'package:${projectName}/features/${packageName}${featureName}/domain/repositories/${fileName}_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${fileName}_cubit.freezed.dart';
part '${fileName}_state.dart';


@injectable
class ${modelName}Cubit extends Cubit<${modelName}State> {
  ${modelName}Cubit(
      {required ${modelName}Repository ${modelInstance}Repository})
      : _${modelInstance}Repository = ${modelInstance}Repository,
        super(const ${modelName}State.initial());

  final ${modelName}Repository _${modelInstance}Repository;

  Future<void> fetch${modelName}Data(
      {bool isRefresh = false}) async {
    try {
      if (!isRefresh) {
        emit(const ${modelName}State.loading());
      }
      final response =
          await _${modelInstance}Repository.get${modelName}();
      response.when(success: (success) {
        emit(${modelName}State.success(success));
      }, error: (error) {
        emit(${modelName}State.error(error.toString()));
      });
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
" > "presentation/cubit/${fileName}_cubit.dart"

################# State for feature -> presentation/cubit/${fileName}_provider.dart ###################

echo "part of '${fileName}_cubit.dart';

@freezed
class ${modelName}State with _$"${modelName}State" {
  const factory ${modelName}State.initial() = _Initial;
  const factory ${modelName}State.loading() = _Loading;

  const factory ${modelName}State.success(
      ${modelName}Model ${modelInstance}Model) = _Success;

  const factory ${modelName}State.error(String error) = _Error;
}
" > "presentation/cubit/${fileName}_state.dart"


################# Screen for feature -> presentation/screens/${fileName}_home_screen.dart ###################

echo "import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:${projectName}/core/injection/injection.dart';
import 'package:${projectName}/features/${packageName}${featureName}/presentation/cubit/${fileName}_cubit.dart';

@RoutePage(name:'${modelName}')
class ${modelName}Screen extends StatelessWidget {
  const ${modelName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<${modelName}Cubit>()..fetch${modelName}Data(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('${modelName}'),
        ),
        body: BlocBuilder<${modelName}Cubit,${modelName}State>(
          builder: (context, state) {
           return state.map(
              initial: (_) => const SizedBox.shrink(),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              success: (state) =>
                  Center(child: Text(state.${modelInstance}Model.toString())),
              error: (state) => Center(child: Text(state.error)),
            );
          },
        ),
      ),
    );
  }
}" > "presentation/screens/${fileName}_screen.dart"


flutter pub run build_runner build --delete-conflicting-outputs

echo "Project structure created successfully!"


# To execute the folder_structure.sh script, navigate to your root project folder and enter the following command:

# ./folder_structure.sh argument1 argument2

# If you encounter a permission issue when attempting to run the script file, use the following command to modify the file permissions:

# chmod 777 folder_structure.sh