import 'dart:developer';

import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBook(FireBookModel book) async {
    try {
      final docRef = _firestore.collection('books');
      final firstDocRef = docRef.doc('zEkjsYhBxZMjcmNkQ1ZH');
      final bookListCollection = firstDocRef.collection('bookList');

      // Ensure the bookList collection exists by adding a temporary document if needed
      // final bookListSnapshot = await bookListCollection.limit(1).get();
      // if (bookListSnapshot.docs.isEmpty) {
      //   await bookListCollection.doc('temp_doc').set({'initialized': true});
      // }

      await _firestore.runTransaction(
        (transaction) async {
          final docSnapshot = await transaction.get(firstDocRef);

          int bookCount =
              docSnapshot.exists ? docSnapshot.data()!['bookCount'] as int : 0;

          String docId = DateTime.now().millisecondsSinceEpoch.toString();

          final bookListRef = bookListCollection.doc(docId);

          transaction.set(bookListRef, book.copyWith(bookId: docId).toJson());

          final bookStatusDetailRef =
              bookListRef.collection('bookStatusDetail');

          for (int i = 0; i < (book.quantity ?? 1); i++) {
            int bookNumber = bookCount + i + 1;
            final bookStatus = BookStatusDetail(
              bookNumber: bookNumber,
              bookStatus: 'available',
              bookIssuedDate: null,
              bookReceivingDate: null,
            );

            transaction.set(bookStatusDetailRef.doc(bookNumber.toString()),
                bookStatus.toJson());
          }

          transaction.update(
              firstDocRef, {'bookCount': bookCount + (book.quantity ?? 0)});
        },
      );

      print('Book added successfully.');
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  Future<List<FireBookModel>?> getFirebaseBooks() async {
    try {
      final docRef = _firestore.collection('books');
      final firstDocRef = docRef.doc('zEkjsYhBxZMjcmNkQ1ZH');
      final bookListCollection = firstDocRef.collection('bookList');

      final querySnapshot = await bookListCollection
          .orderBy('bookId', descending: true)
          .limit(10)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) => FireBookModel.fromJson(doc.data()))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting books: $e');
    }
    return null;
  }

  Future<List<FireBookModel>?> getFavoriteBooks(List<String>? favorites) async {
    if (favorites == null || favorites.isEmpty) return [];

    try {
      final collection = FirebaseFirestore.instance
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList');

      List<FireBookModel> favoriteBooks = [];

      for (String bookId in favorites) {
        final docSnapshot = await collection.doc(bookId).get();
        if (docSnapshot.exists) {
          favoriteBooks.add(FireBookModel.fromJson(docSnapshot.data()!));
        }
      }

      return favoriteBooks;
    } catch (e) {
      log("Error fetching favorite books: $e");
      return null;
    }
  }

  Future<List<BookStatusDetail>?> getBookDetailsStatus(String? bookId) async {
    if (bookId == null) return null;
    try {
      final collection = _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookId)
          .collection('bookStatusDetail');

      final docSnapshot = await collection.get();

      List<BookStatusDetail> bookStatus = docSnapshot.docs
          .map((doc) => BookStatusDetail.fromJson(doc.data()))
          .toList();

      return bookStatus;
    } catch (e) {
      log("Error fetching books status: $e");
      return null;
    }
  }
}
