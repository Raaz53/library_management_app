import 'dart:developer';

import 'package:book_hive/core/models/book_lend_approval_model/book_lend_approval_model.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/services/google_book_api_handler.dart';

import 'book_database.dart';

class BookService {
  BookService._();

  static final GoogleBookApiHandler _googleBookApiHandler =
      GoogleBookApiHandler();
  static final BookDatabase _bookDatabase = BookDatabase();

  static fetchBooksWithQuery(String query, [int page = 1]) async {
    try {
      final books = await _googleBookApiHandler.searchBooks(query,
          maxResults: 10, startIndex: (page - 1) * 10);
      return books;
    } catch (e) {
      log('Error fetching books: $e');
    }
  }

  static fetchBookById(String bookId) async {
    try {
      final book = await _googleBookApiHandler.getBookById(bookId);
      return book;
    } catch (e) {
      log('Error fetching book details: $e');
    }
  }

  static fetchBooksWithAuthor(String author, [int page = 1]) async {
    try {
      final books = await _googleBookApiHandler.getBooksByAuthor(author,
          maxResults: 10, startIndex: (page - 1) * 10);
      return books;
    } catch (e) {
      log('Error fetching books: $e');
    }
  }

  static fetchBooksByCategories(List<String> categories, [int page = 1]) async {
    try {
      final books = await _googleBookApiHandler.getBooksByCategories(categories,
          maxResults: 10, startIndex: (page - 1) * 10);
      return books;
    } catch (e) {
      log('Error fetching books: $e');
    }
  }

  static addBookToFirebase(FireBookModel book) async {
    try {
      await _bookDatabase.addBook(book).whenComplete(() {
        log('Book added to Firebase successfully');
      });
    } catch (e) {
      log('Error adding book to Firebase: $e');
    }
  }

  static getFirebaseBooks() async {
    try {
      final data = await _bookDatabase.getFirebaseBooks();
      return data;
    } catch (e) {
      log('Error fetching books from Firebase: $e');
    }
  }

  static getFavoriteBooks(List<String>? favoriteBooksId) async {
    try {
      final data = await _bookDatabase.getFavoriteBooks(favoriteBooksId);
      return data;
    } catch (e) {
      log('the error is thrown during getting favorite books: $e');
    }
  }

  static getBookStatusDetails(String? bookId) async {
    try {
      final data = await _bookDatabase.getBookDetailsStatus(bookId);
      return data;
    } catch (e) {
      log('the error is thrown during getting book status details: $e');
    }
  }

  static getBookLendLog(String? bookLendId) async {
    try {
      final data = await _bookDatabase.getLendBook(bookLendId);
      return data;
    } catch (e) {
      log('the error is thrown in getting bookLend log');
    }
  }

  static getLendBookHistory(List<String>? bookLendIds) async {
    try {
      final data = await _bookDatabase.getLendBookHistory(bookLendIds);
      return data;
    } catch (e) {
      log('error thrown in getting book lend history');
    }
  }

  static getSingleFireBook(String? bookId) async {
    try {
      final data = await _bookDatabase.getSingleFireBook(bookId);
      return data;
    } catch (e) {
      log('error thrown in getting single book');
    }
  }

  static getBookLog() async {
    try {
      final data = await _bookDatabase.getPendingBookRequests();
      return data;
    } catch (e) {
      log('error thrown in getting books log');
    }
  }

  static acceptBookLend(BookLendApprovalModel? bookLendApproval) async {
    try {
      await _bookDatabase.acceptBookLend(bookLendApproval);
      return 'success';
    } catch (e) {
      log('error thrown in accepting book request');
      return e.toString();
    }
  }

  static declineBookLend(BookLendApprovalModel? bookLendApprovalModel) async {
    try {
      final data = await _bookDatabase.declineBookLend(bookLendApprovalModel);
      return data;
    } catch (e) {
      log('error thrown in declining books request');
    }
  }

  static addReview(ReviewModel? reviewModel, String? bookId) async {
    try {
      await _bookDatabase.addBookReview(reviewModel, bookId);
    } catch (e) {
      log('error thrown in adding review');
    }
  }

  static getReviews(String? bookId) async {
    try {
      final data = await _bookDatabase.getBookReviews(bookId);

      return data;
    } catch (e) {
      log('error thrown in getting review');
    }
  }

  static editReview(
      String? updatedReview, String? bookId, String? reviewId) async {
    try {
      await _bookDatabase.editBookReview(updatedReview, bookId, reviewId);
    } catch (e) {
      log('error thrown in editing review');
    }
  }
}
