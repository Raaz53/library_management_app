import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_profile_cubit.freezed.dart';
part 'get_user_profile_state.dart';

class GetUserProfileCubit extends Cubit<GetUserProfileState> {
  GetUserProfileCubit() : super(GetUserProfileState.initial());

  Future<void> getUserProfile() async {
    emit(GetUserProfileState.loading());
    try {
      final uid = AuthService.getCurrentUserId();
      final UserModel? userData = await AuthService.getUserDetails(uid);

      globalUserRole = userData?.role ?? UserRole.user;
      userFavoriteBooks = userData?.favourites ?? [];
      emit(GetUserProfileState.success(userData));
    } catch (e) {
      emit(GetUserProfileState.error(e.toString()));
    }
  }
}
