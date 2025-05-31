import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_return_model.freezed.dart';
part 'book_return_model.g.dart';

@freezed
class BookReturnModel with _$BookReturnModel {
  factory BookReturnModel({
    String? lendId,
    String? bookId,
    String? bookNumber,
    String? returnedDate,
  }) = _BookReturnModel;

  factory BookReturnModel.fromJson(Map<String, dynamic> json) =>
      _$BookReturnModelFromJson(json);
}
