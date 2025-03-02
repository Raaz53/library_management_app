import 'dart:developer';

import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_repository.dart';

class CustomUserModel {
  final User? user;
  final String? uid;

  CustomUserModel({this.user, this.uid});
}

class AuthService {
  AuthService._();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final _userRepo = UserRepository();

  static Future<CustomUserModel?> createUserWithEmailAndPassword(
      UserModel userModel, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      );
      final uid = userCredential.user?.uid;

      await _userRepo.createUser(userModel, uid);

      return CustomUserModel(user: userCredential.user, uid: uid);
    } catch (e) {
      log('Error creating user: ${e.toString()}');
      return null;
    }
  }

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      log('Error signing in: ${e.toString()}');
      return null;
    }
  }

  static getCurrentUserId() {
    return _auth.currentUser!.uid;
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Error signing out: ${e.toString()}');
    }
  }

  static getUserDetails(String uid) async {
    try {
      final user = await _userRepo.getUser(uid);
      return user;
    } catch (e) {
      log('Error getting user details: ${e.toString()}');
      return null;
    }
  }

  static updateFavoriteList(String bookId, bool isFavorite) async {
    try {
      final user = _auth.currentUser;
      await _userRepo.updateFavoriteBook(
          bookId: bookId, uid: user?.uid, isFavorite: isFavorite);
      return 'success';
    } catch (e) {
      log('here the update has failed');
    }
  }
}
