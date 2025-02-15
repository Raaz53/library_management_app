import 'dart:developer';

import 'package:book_hive/core/services/google_book_api_handler.dart';

class BookService {
  BookService._();

  static final GoogleBookApiHandler _googleBookApiHandler =
      GoogleBookApiHandler();

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
}
