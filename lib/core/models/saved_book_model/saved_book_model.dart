import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_book_model.freezed.dart';
part 'saved_book_model.g.dart';

@freezed
class SavedBookModel with _$SavedBookModel {
  factory SavedBookModel({
    int? bookCount,
  }) = _SavedBookModel;

  factory SavedBookModel.fromJson(Map<String, dynamic> json) =>
      _$SavedBookModelFromJson(json);
}

@freezed
class FireBookModel with _$FireBookModel {
  factory FireBookModel({
    String? bookId,
    String? googleId,
    String? bookName,
    String? bookImage,
    String? bookDescription,
    double? rating,
    int? ratingCount,
    String? publishedDate,
    String? authors,
    int? pageCount,
    List<String>? categories,
    int? quantity,
  }) = _FireBookModel;

  factory FireBookModel.fromJson(Map<String, dynamic> json) =>
      _$FireBookModelFromJson(json);
}

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    String? studentId,
    String? reviewString,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
class BookStatusDetail with _$BookStatusDetail {
  factory BookStatusDetail({
    int? bookNumber,
    String? bookStatus,
    DateTime? bookIssuedDate,
    DateTime? bookReceivingDate,
  }) = _BookStatusDetail;

  factory BookStatusDetail.fromJson(Map<String, dynamic> json) =>
      _$BookStatusDetailFromJson(json);
}
