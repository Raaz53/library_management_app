import 'dart:developer';

import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/utilities/constants.dart';
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

  Future<void> requestBookLendHistory(
      String? uid, BookLendedHistory? bookLendedHistory) async {
    try {
      final collection = _firestore.collection('bookLog');

      final String docId = DateTime.now().millisecondsSinceEpoch.toString();

      final updatedBookLendedHistory =
          bookLendedHistory?.copyWith(bookLendId: docId, studentId: uid);

      if (updatedBookLendedHistory != null) {
        await collection
            .doc(docId)
            .set(updatedBookLendedHistory.toJson())
            .whenComplete(() async {
          final userDocRef = _firestore.collection('users').doc(uid);

          // Update borrowedBookList by adding the new docId
          await userDocRef.update({
            'borrowedBookList': FieldValue.arrayUnion([docId])
          });

          final bookDocRef = _firestore
              .collection('books')
              .doc('zEkjsYhBxZMjcmNkQ1ZH')
              .collection('bookList')
              .doc(updatedBookLendedHistory.bookId)
              .collection('bookStatusDetail')
              .doc(updatedBookLendedHistory.bookNumber);

          await bookDocRef
              .update({'bookStatus': LibraryBookStatus.unavailable});

          log('Book lended history added and borrowedBookList updated successfully.');
        });
      }
      log('Book lended history added successfully.');
    } catch (e) {
      log('Error adding book lended history: $e');
    }
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

  Future<UserModel?> getUserById(String? uid) async {
    try {
      final docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        final data = UserModel.fromJson(docSnapshot.data()!);
        log('here the data is $data');
        return data;
      }

      return null;
    } catch (e) {
      log('Error getting user: $e');
      return null;
    }
  }
}
