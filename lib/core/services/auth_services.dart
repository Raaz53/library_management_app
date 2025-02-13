import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/utilities/utilities.dart';
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
      print(e);
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
