import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_lend_approval_model.freezed.dart';
part 'book_lend_approval_model.g.dart';

@freezed
class BookLendApprovalModel with _$BookLendApprovalModel {
  factory BookLendApprovalModel({
    String? lendId,
    String? lenderId,
    String? userId,
    String? bookStatus,
    String? bookId,
    String? bookNumber,
    String? bookDueDate,
    String? bookIssueDate,
  }) = _BookLendApprovalModel;

  factory BookLendApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$BookLendApprovalModelFromJson(json);
}
