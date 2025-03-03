// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      rewardPoints: (json['rewardPoints'] as num?)?.toDouble(),
      favourites: (json['favourites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      borrowedBookList: (json['borrowedBookList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profilePicture: json['profilePicture'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'rewardPoints': instance.rewardPoints,
      'favourites': instance.favourites,
      'borrowedBookList': instance.borrowedBookList,
      'profilePicture': instance.profilePicture,
      'role': instance.role,
    };

_$BookLendedHistoryImpl _$$BookLendedHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$BookLendedHistoryImpl(
      bookLendId: json['bookLendId'] as String?,
      bookId: json['bookId'] as String?,
      studentId: json['studentId'] as String?,
      lenderId: json['lenderId'] as String?,
      bookNumber: json['bookNumber'] as String?,
      bookIssuedDate: json['bookIssuedDate'] == null
          ? null
          : DateTime.parse(json['bookIssuedDate'] as String),
      bookDueDate: json['bookDueDate'] == null
          ? null
          : DateTime.parse(json['bookDueDate'] as String),
      bookReturnedDate: json['bookReturnedDate'] == null
          ? null
          : DateTime.parse(json['bookReturnedDate'] as String),
      bookIssueStatus: json['bookIssueStatus'] as String?,
    );

Map<String, dynamic> _$$BookLendedHistoryImplToJson(
        _$BookLendedHistoryImpl instance) =>
    <String, dynamic>{
      'bookLendId': instance.bookLendId,
      'bookId': instance.bookId,
      'studentId': instance.studentId,
      'lenderId': instance.lenderId,
      'bookNumber': instance.bookNumber,
      'bookIssuedDate': instance.bookIssuedDate?.toIso8601String(),
      'bookDueDate': instance.bookDueDate?.toIso8601String(),
      'bookReturnedDate': instance.bookReturnedDate?.toIso8601String(),
      'bookIssueStatus': instance.bookIssueStatus,
    };
