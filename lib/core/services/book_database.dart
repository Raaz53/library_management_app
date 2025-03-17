import 'dart:developer';

import 'package:book_hive/core/models/book_lend_approval_model/book_lend_approval_model.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/utilities/constants.dart';
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

  Future<BookStatusDetail?> getLendBook(String? bookLendId) async {
    if (bookLendId == null) return null;
    try {
      final collection = _firestore.collection('bookLog');
      final docSnapshot = await collection.doc(bookLendId).get();
      if (docSnapshot.exists) {
        return BookStatusDetail.fromJson(docSnapshot.data()!);
      } else {
        log('No book found with ID: $bookLendId');
        return null;
      }
    } catch (e) {
      log('Error getting bookLendId');
      return null;
    }
  }

  Future<List<BookLendedHistory>?> getLendBookHistory(
      List<String>? bookLendIds) async {
    if (bookLendIds == null) return null;
    try {
      final collection = _firestore.collection('bookLog');
      List<BookLendedHistory> lendBookHistory = [];

      for (String bookLendId in bookLendIds) {
        final docSnapshot = await collection.doc(bookLendId).get();

        if (docSnapshot.exists) {
          final data = docSnapshot.data();
          if (data != null) {
            lendBookHistory.add(BookLendedHistory.fromJson(data));
          }
        }
      }
      return lendBookHistory;
    } catch (e) {
      log('Error fetching lend book history: $e');
      return null;
    }
  }

  Future<FireBookModel?> getSingleFireBook(String? bookId) async {
    if (bookId == null) return null;
    try {
      final collection = _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookId);
      final docSnap = await collection.get();
      if (docSnap.exists) {
        final data = docSnap.data();
        if (data != null) return FireBookModel.fromJson(data);
      }
      return null;
    } catch (e) {
      log('Error fetching single book history: $e');
      return null;
    }
  }

  Future<List<BookLendedHistory>?> getPendingBookRequests() async {
    try {
      final collection = _firestore.collection('bookLog');

      final querySnapshot = await collection.get();

      List<BookLendedHistory> pendingBooks = querySnapshot.docs
          .map((doc) => BookLendedHistory.fromJson(doc.data()))
          .toList();

      return pendingBooks;
    } catch (e) {
      log('Error fetching pending book requests: $e');
      return null;
    }
  }

  Future<void> acceptBookLend(BookLendApprovalModel? bookLendApproval) async {
    if (bookLendApproval == null) return;
    try {
      await _firestore
          .collection('bookLog')
          .doc(bookLendApproval.lendId)
          .update({
        'bookIssuedDate': bookLendApproval.bookIssuedDate,
        'bookDueDate': bookLendApproval.bookDueDate,
        'bookIssueStatus': bookLendApproval.bookStatus,
        'lenderId': bookLendApproval.lenderId,
      });

      await _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookLendApproval.bookId)
          .update({
        'lenders': bookLendApproval.userId,
      });

      await _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookLendApproval.bookId)
          .collection('bookStatusDetail')
          .doc(bookLendApproval.bookNumber)
          .update({
        'bookIssuedDate': bookLendApproval.bookIssuedDate,
        'bookReceivingDate': bookLendApproval.bookDueDate,
      });

      log('Book lend accepted successfully.');
    } catch (e) {
      log('Error accepting book lend: $e');
    }
  }

  Future<void> declineBookLend(BookLendApprovalModel? bookLendApproval) async {
    if (bookLendApproval == null) return;

    try {
      await _firestore
          .collection('bookLog')
          .doc(bookLendApproval.lendId)
          .update({
        'bookIssueStatus': bookLendApproval.bookStatus,
        'lenderId': bookLendApproval.lenderId,
      });

      await _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookLendApproval.bookId)
          .collection('bookStatusDetail')
          .doc(bookLendApproval.bookNumber)
          .update({
        'bookStatus': LibraryBookStatus.available,
      });

      log('Book lend declined successfully.');
    } catch (e) {
      log('Error declining book lend: $e');
    }
  }

  Future<void> addBookReview(ReviewModel? review, String? bookId) async {
    if (review == null || bookId == null) return;
    try {
      final docRef = _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookId)
          .collection('reviews')
          .doc();

      final updateReview = review.copyWith(reviewId: docRef.id);

      await docRef.set(updateReview.toJson());

      log('Review added successfully.');
    } catch (e) {
      log('Error adding review: $e');
    }
  }

  Future<List<ReviewModel>?> getBookReviews(String? bookId) async {
    if (bookId == null) return null;
    try {
      final docRef = _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookId);

      final reviewCollection = docRef.collection('reviews');

      final querySnapshot = await reviewCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) => ReviewModel.fromJson(doc.data()))
            .toList();
      }

      return [];
    } catch (e) {
      log('Error fetching reviews: $e');
      return null;
    }
  }

  Future<void> editBookReview(
      String? bookId, String? reviewId, String? updatedReview) async {
    if (bookId == null || reviewId == null) return;
    try {
      final docRef = _firestore
          .collection('books')
          .doc('zEkjsYhBxZMjcmNkQ1ZH')
          .collection('bookList')
          .doc(bookId)
          .collection('reviews')
          .doc(reviewId);

      await docRef.update({
        'reviewString': updatedReview,
      });

      log('Review edited successfully.');
    } catch (e) {
      log('Error editing review: $e');
    }
  }
}
