import 'dart:developer';

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
}
