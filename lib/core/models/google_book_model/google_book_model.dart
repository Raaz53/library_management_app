import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_book_model.freezed.dart';
part 'google_book_model.g.dart';

@freezed
class BookResponse with _$BookResponse {
  const factory BookResponse({
    String? kind,
    List<BookItem>? items,
  }) = _BookResponse;

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);
}

@freezed
class BookItem with _$BookItem {
  const factory BookItem({
    String? kind,
    String? id,
    String? selfLink,
    VolumeInfo? volumeInfo,
  }) = _BookItem;
  factory BookItem.fromJson(Map<String, dynamic> json) =>
      _$BookItemFromJson(json);
}

@freezed
class VolumeInfo with _$VolumeInfo {
  const factory VolumeInfo({
    String? title,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    int? pageCount,
    double? averageRating,
    int? ratingsCount,
    ImageLinks? imageLinks,
    String? language,
  }) = _VolumeInfo;
  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

@freezed
class ImageLinks with _$ImageLinks {
  const factory ImageLinks({
    String? smallThumbnail,
    String? thumbnail,
  }) = _ImageLinks;
  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
