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
      booksLendedHistory: (json['booksLendedHistory'] as List<dynamic>?)
          ?.map((e) => BookLendedHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'rewardPoints': instance.rewardPoints,
      'favourites': instance.favourites,
      'booksLendedHistory': instance.booksLendedHistory,
    };

_$BookLendedHistoryImpl _$$BookLendedHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$BookLendedHistoryImpl(
      bookId: json['bookId'] as String?,
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
      'bookId': instance.bookId,
      'bookNumber': instance.bookNumber,
      'bookIssuedDate': instance.bookIssuedDate?.toIso8601String(),
      'bookDueDate': instance.bookDueDate?.toIso8601String(),
      'bookReturnedDate': instance.bookReturnedDate?.toIso8601String(),
      'bookIssueStatus': instance.bookIssueStatus,
    };
