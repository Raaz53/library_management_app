import 'dart:developer';

import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createUser(UserModel userModel, String? uid) async {
    try {
      final collection = _firestore.collection('users');
      final updatedUser = userModel.copyWith(id: uid);
      await collection.doc(uid).set(updatedUser.toJson()).whenComplete(() {
        log('here the account is created');
      });
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> bookLendedHistory(
      String? uid, BookLendedHistory? lendedBook) async {
    if (uid == null) {
      return 'User id is null';
    }
    try {
      final collection = _firestore
          .collection('users')
          .doc(uid)
          .collection('bookLendedHistory');
      await collection.add(lendedBook!.toJson());
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final collection = _firestore.collection('users');
      final doc = await collection.doc(uid).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
