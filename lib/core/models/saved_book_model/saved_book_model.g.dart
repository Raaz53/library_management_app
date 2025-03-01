// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedBookModelImpl _$$SavedBookModelImplFromJson(Map<String, dynamic> json) =>
    _$SavedBookModelImpl(
      bookCount: (json['bookCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SavedBookModelImplToJson(
        _$SavedBookModelImpl instance) =>
    <String, dynamic>{
      'bookCount': instance.bookCount,
    };

_$FireBookModelImpl _$$FireBookModelImplFromJson(Map<String, dynamic> json) =>
    _$FireBookModelImpl(
      bookId: json['bookId'] as String?,
      googleId: json['googleId'] as String?,
      bookName: json['bookName'] as String?,
      bookImage: json['bookImage'] as String?,
      bookDescription: json['bookDescription'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: (json['ratingCount'] as num?)?.toInt(),
      publishedDate: json['publishedDate'] as String?,
      authors: json['authors'] as String?,
      pageCount: (json['pageCount'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FireBookModelImplToJson(_$FireBookModelImpl instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'googleId': instance.googleId,
      'bookName': instance.bookName,
      'bookImage': instance.bookImage,
      'bookDescription': instance.bookDescription,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'publishedDate': instance.publishedDate,
      'authors': instance.authors,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'quantity': instance.quantity,
    };

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      studentId: json['studentId'] as String?,
      reviewString: json['reviewString'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'reviewString': instance.reviewString,
    };

_$BookStatusDetailImpl _$$BookStatusDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$BookStatusDetailImpl(
      bookNumber: (json['bookNumber'] as num?)?.toInt(),
      bookStatus: json['bookStatus'] as String?,
      bookIssuedDate: json['bookIssuedDate'] == null
          ? null
          : DateTime.parse(json['bookIssuedDate'] as String),
      bookReceivingDate: json['bookReceivingDate'] == null
          ? null
          : DateTime.parse(json['bookReceivingDate'] as String),
    );

Map<String, dynamic> _$$BookStatusDetailImplToJson(
        _$BookStatusDetailImpl instance) =>
    <String, dynamic>{
      'bookNumber': instance.bookNumber,
      'bookStatus': instance.bookStatus,
      'bookIssuedDate': instance.bookIssuedDate?.toIso8601String(),
      'bookReceivingDate': instance.bookReceivingDate?.toIso8601String(),
    };
