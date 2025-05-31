// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_return_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookReturnModelImpl _$$BookReturnModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookReturnModelImpl(
      lendId: json['lendId'] as String?,
      bookId: json['bookId'] as String?,
      bookNumber: json['bookNumber'] as String?,
      returnedDate: json['returnedDate'] as String?,
    );

Map<String, dynamic> _$$BookReturnModelImplToJson(
        _$BookReturnModelImpl instance) =>
    <String, dynamic>{
      'lendId': instance.lendId,
      'bookId': instance.bookId,
      'bookNumber': instance.bookNumber,
      'returnedDate': instance.returnedDate,
    };
