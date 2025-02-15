import 'dart:convert';
import 'package:book_hive/core/models/google_book_model/google_book_model.dart';
import 'package:dio/dio.dart';

class GoogleBookApiHandler {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://www.googleapis.com/books/v1/volumes",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String _apiKey = "AIzaSyCx-83Pp_C5Ug5_6MNdeubds4ynP-HjfFQ";

  GoogleBookApiHandler();

  Future<List<BookItem>> searchBooks(
    String query, {
    int maxResults = 10,
    int startIndex = 0,
  }) async {
    try {
      final response = await _dio.get(
        "",
        queryParameters: {
          "q": query,
          "maxResults": maxResults,
          "startIndex": startIndex,
          "key": _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final bookResponse = BookResponse.fromJson(data);
        return bookResponse.items ?? [];
      } else {
        throw Exception("Failed to fetch books: ${response.statusCode}");
      }
    } catch (e) {
      print("Error searching books: $e");
      return [];
    }
  }

  Future<BookItem?> getBookById(String bookId) async {
    try {
      final response = await _dio.get(
        "/$bookId",
        queryParameters: {
          "key": _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return BookItem.fromJson(data);
      } else {
        throw Exception("Failed to fetch book details: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching book details: $e");
      return null;
    }
  }

  Future<List<BookItem>> getBooksByCategories(
    List<String> categories, {
    int maxResults = 10,
    int startIndex = 0,
  }) async {
    try {
      // Join multiple categories with " OR " for the API request
      String categoryQuery = categories.map((c) => 'subject:$c').join(' OR ');

      final response = await _dio.get(
        "",
        queryParameters: {
          "q": categoryQuery,
          "maxResults": maxResults,
          "startIndex": startIndex,
          "key": _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final bookResponse = BookResponse.fromJson(data);
        return bookResponse.items ?? [];
      } else {
        throw Exception(
            "Failed to fetch books by categories: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching books by categories: $e");
      return [];
    }
  }

  Future<List<BookItem>> getBooksByAuthor(
    String authorName, {
    int maxResults = 10,
    int startIndex = 0,
  }) async {
    try {
      final response = await _dio.get(
        "",
        queryParameters: {
          "q": "inauthor:$authorName",
          "maxResults": maxResults,
          "startIndex": startIndex,
          "key": _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final bookResponse = BookResponse.fromJson(data);
        return bookResponse.items ?? [];
      } else {
        throw Exception(
            "Failed to fetch books by author: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching books by author: $e");
      return [];
    }
  }
}
