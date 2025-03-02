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

  Future<void> updateFavoriteBook({
    String? bookId,
    String? uid,
    required bool isFavorite,
  }) async {
    try {
      final collection = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(collection);

        if (!snapshot.exists) {
          throw Exception("User document not found");
        }

        List<String> favorites =
            List<String>.from(snapshot.data()?['favourites'] ?? []);

        if (isFavorite) {
          if (!favorites.contains(bookId)) {
            favorites.add(bookId!);
          }
        } else {
          favorites.remove(bookId);
        }

        transaction.update(collection, {'favourites': favorites});
      });

      log('Favorites updated successfully');
    } catch (e) {
      log('Error updating favorites: $e');
    }
  }
}
