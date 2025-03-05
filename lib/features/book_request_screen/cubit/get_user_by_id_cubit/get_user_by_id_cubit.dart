import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_by_id_cubit.freezed.dart';
part 'get_user_by_id_state.dart';

class GetUserByIdCubit extends Cubit<GetUserByIdState> {
  GetUserByIdCubit() : super(const GetUserByIdState.initial());

  Future<void> getUserById(String? uid) async {
    emit(GetUserByIdState.loading());
    try {
      final data = await AuthService.getUserById(uid);
      log('data: $data');
      if (data != null) {
        emit(GetUserByIdState.success(data));
      } else {
        emit(GetUserByIdState.error('Error while getting user from id'));
      }
    } catch (e) {
      log('Error in get user by id cubit');
    }
  }
}
