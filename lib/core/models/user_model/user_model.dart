import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
// @JsonSerializable(explicitToJson: true)
class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    String? name,
    String? email,
    String? bio,
    double? rewardPoints,
    List<String>? favourites,
    List<String>? borrowedBookList,
    String? profilePicture,
    String? role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class BookLendedHistory with _$BookLendedHistory {
  factory BookLendedHistory({
    String? bookLendId,
    String? bookId,
    String? studentId,
    String? lenderId,
    String? bookNumber,
    DateTime? bookIssuedDate,
    DateTime? bookDueDate,
    DateTime? bookReturnedDate,
    String? bookIssueStatus,
  }) = _BookLendedHistory;

  factory BookLendedHistory.fromJson(Map<String, dynamic> json) =>
      _$BookLendedHistoryFromJson(json);
}
