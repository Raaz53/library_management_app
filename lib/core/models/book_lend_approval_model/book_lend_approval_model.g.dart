// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_lend_approval_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookLendApprovalModelImpl _$$BookLendApprovalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookLendApprovalModelImpl(
      lendId: json['lendId'] as String?,
      lenderId: json['lenderId'] as String?,
      userId: json['userId'] as String?,
      bookStatus: json['bookStatus'] as String?,
      bookId: json['bookId'] as String?,
      bookNumber: json['bookNumber'] as String?,
      bookDueDate: json['bookDueDate'] as String?,
      bookIssuedDate: json['bookIssuedDate'] as String?,
    );

Map<String, dynamic> _$$BookLendApprovalModelImplToJson(
        _$BookLendApprovalModelImpl instance) =>
    <String, dynamic>{
      'lendId': instance.lendId,
      'lenderId': instance.lenderId,
      'userId': instance.userId,
      'bookStatus': instance.bookStatus,
      'bookId': instance.bookId,
      'bookNumber': instance.bookNumber,
      'bookDueDate': instance.bookDueDate,
      'bookIssuedDate': instance.bookIssuedDate,
    };
