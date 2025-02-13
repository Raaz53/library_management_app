import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createUser(UserModel userModel, String? uid) async {
    try {
      final collection = _firestore.collection('users');
      final updatedUser = userModel.copyWith(id: uid);
      print('the user id is created $uid');
      await collection.doc(uid).set(updatedUser.toJson());
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
