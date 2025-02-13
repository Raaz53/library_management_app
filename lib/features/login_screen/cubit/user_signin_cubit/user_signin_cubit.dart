import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_signin_cubit.freezed.dart';
part 'user_signin_state.dart';

class UserSignInCubit extends Cubit<UserSignInState> {
  UserSignInCubit() : super(UserSignInState.initial());

  Future<void> registerUser({
    required UserModel userModel,
    required String password,
  }) async {
    emit(UserSignInState.loading());
    try {
      final data =
          await AuthService.createUserWithEmailAndPassword(userModel, password);
      if (data == null) {
        emit(UserSignInState.error(error: 'Error creating user'));
      } else {
        emit(UserSignInState.success(message: ''));
      }
    } catch (e) {
      emit(UserSignInState.error(
        error: e.toString(),
      ));
    }
  }
}
