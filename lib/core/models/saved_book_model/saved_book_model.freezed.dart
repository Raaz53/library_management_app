// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedBookModel _$SavedBookModelFromJson(Map<String, dynamic> json) {
  return _SavedBookModel.fromJson(json);
}

/// @nodoc
mixin _$SavedBookModel {
  int? get bookCount => throw _privateConstructorUsedError;

  /// Serializes this SavedBookModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedBookModelCopyWith<SavedBookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedBookModelCopyWith<$Res> {
  factory $SavedBookModelCopyWith(
          SavedBookModel value, $Res Function(SavedBookModel) then) =
      _$SavedBookModelCopyWithImpl<$Res, SavedBookModel>;
  @useResult
  $Res call({int? bookCount});
}

/// @nodoc
class _$SavedBookModelCopyWithImpl<$Res, $Val extends SavedBookModel>
    implements $SavedBookModelCopyWith<$Res> {
  _$SavedBookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookCount = freezed,
  }) {
    return _then(_value.copyWith(
      bookCount: freezed == bookCount
          ? _value.bookCount
          : bookCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedBookModelImplCopyWith<$Res>
    implements $SavedBookModelCopyWith<$Res> {
  factory _$$SavedBookModelImplCopyWith(_$SavedBookModelImpl value,
          $Res Function(_$SavedBookModelImpl) then) =
      __$$SavedBookModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? bookCount});
}

/// @nodoc
class __$$SavedBookModelImplCopyWithImpl<$Res>
    extends _$SavedBookModelCopyWithImpl<$Res, _$SavedBookModelImpl>
    implements _$$SavedBookModelImplCopyWith<$Res> {
  __$$SavedBookModelImplCopyWithImpl(
      _$SavedBookModelImpl _value, $Res Function(_$SavedBookModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookCount = freezed,
  }) {
    return _then(_$SavedBookModelImpl(
      bookCount: freezed == bookCount
          ? _value.bookCount
          : bookCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedBookModelImpl implements _SavedBookModel {
  _$SavedBookModelImpl({this.bookCount});

  factory _$SavedBookModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedBookModelImplFromJson(json);

  @override
  final int? bookCount;

  @override
  String toString() {
    return 'SavedBookModel(bookCount: $bookCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedBookModelImpl &&
            (identical(other.bookCount, bookCount) ||
                other.bookCount == bookCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookCount);

  /// Create a copy of SavedBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedBookModelImplCopyWith<_$SavedBookModelImpl> get copyWith =>
      __$$SavedBookModelImplCopyWithImpl<_$SavedBookModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedBookModelImplToJson(
      this,
    );
  }
}

abstract class _SavedBookModel implements SavedBookModel {
  factory _SavedBookModel({final int? bookCount}) = _$SavedBookModelImpl;

  factory _SavedBookModel.fromJson(Map<String, dynamic> json) =
      _$SavedBookModelImpl.fromJson;

  @override
  int? get bookCount;

  /// Create a copy of SavedBookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedBookModelImplCopyWith<_$SavedBookModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FireBookModel _$FireBookModelFromJson(Map<String, dynamic> json) {
  return _FireBookModel.fromJson(json);
}

/// @nodoc
mixin _$FireBookModel {
  String? get bookId => throw _privateConstructorUsedError;
  String? get googleId => throw _privateConstructorUsedError;
  String? get bookName => throw _privateConstructorUsedError;
  String? get bookImage => throw _privateConstructorUsedError;
  String? get bookDescription => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get ratingCount => throw _privateConstructorUsedError;
  String? get publishedDate => throw _privateConstructorUsedError;
  String? get authors => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  List<String>? get lenders => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this FireBookModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FireBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FireBookModelCopyWith<FireBookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireBookModelCopyWith<$Res> {
  factory $FireBookModelCopyWith(
          FireBookModel value, $Res Function(FireBookModel) then) =
      _$FireBookModelCopyWithImpl<$Res, FireBookModel>;
  @useResult
  $Res call(
      {String? bookId,
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
      List<String>? lenders,
      int? quantity});
}

/// @nodoc
class _$FireBookModelCopyWithImpl<$Res, $Val extends FireBookModel>
    implements $FireBookModelCopyWith<$Res> {
  _$FireBookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FireBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = freezed,
    Object? googleId = freezed,
    Object? bookName = freezed,
    Object? bookImage = freezed,
    Object? bookDescription = freezed,
    Object? rating = freezed,
    Object? ratingCount = freezed,
    Object? publishedDate = freezed,
    Object? authors = freezed,
    Object? pageCount = freezed,
    Object? categories = freezed,
    Object? lenders = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookName: freezed == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String?,
      bookImage: freezed == bookImage
          ? _value.bookImage
          : bookImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookDescription: freezed == bookDescription
          ? _value.bookDescription
          : bookDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lenders: freezed == lenders
          ? _value.lenders
          : lenders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FireBookModelImplCopyWith<$Res>
    implements $FireBookModelCopyWith<$Res> {
  factory _$$FireBookModelImplCopyWith(
          _$FireBookModelImpl value, $Res Function(_$FireBookModelImpl) then) =
      __$$FireBookModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookId,
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
      List<String>? lenders,
      int? quantity});
}

/// @nodoc
class __$$FireBookModelImplCopyWithImpl<$Res>
    extends _$FireBookModelCopyWithImpl<$Res, _$FireBookModelImpl>
    implements _$$FireBookModelImplCopyWith<$Res> {
  __$$FireBookModelImplCopyWithImpl(
      _$FireBookModelImpl _value, $Res Function(_$FireBookModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FireBookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = freezed,
    Object? googleId = freezed,
    Object? bookName = freezed,
    Object? bookImage = freezed,
    Object? bookDescription = freezed,
    Object? rating = freezed,
    Object? ratingCount = freezed,
    Object? publishedDate = freezed,
    Object? authors = freezed,
    Object? pageCount = freezed,
    Object? categories = freezed,
    Object? lenders = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$FireBookModelImpl(
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookName: freezed == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String?,
      bookImage: freezed == bookImage
          ? _value.bookImage
          : bookImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookDescription: freezed == bookDescription
          ? _value.bookDescription
          : bookDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lenders: freezed == lenders
          ? _value._lenders
          : lenders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FireBookModelImpl implements _FireBookModel {
  _$FireBookModelImpl(
      {this.bookId,
      this.googleId,
      this.bookName,
      this.bookImage,
      this.bookDescription,
      this.rating,
      this.ratingCount,
      this.publishedDate,
      this.authors,
      this.pageCount,
      final List<String>? categories,
      final List<String>? lenders,
      this.quantity})
      : _categories = categories,
        _lenders = lenders;

  factory _$FireBookModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FireBookModelImplFromJson(json);

  @override
  final String? bookId;
  @override
  final String? googleId;
  @override
  final String? bookName;
  @override
  final String? bookImage;
  @override
  final String? bookDescription;
  @override
  final double? rating;
  @override
  final int? ratingCount;
  @override
  final String? publishedDate;
  @override
  final String? authors;
  @override
  final int? pageCount;
  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _lenders;
  @override
  List<String>? get lenders {
    final value = _lenders;
    if (value == null) return null;
    if (_lenders is EqualUnmodifiableListView) return _lenders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? quantity;

  @override
  String toString() {
    return 'FireBookModel(bookId: $bookId, googleId: $googleId, bookName: $bookName, bookImage: $bookImage, bookDescription: $bookDescription, rating: $rating, ratingCount: $ratingCount, publishedDate: $publishedDate, authors: $authors, pageCount: $pageCount, categories: $categories, lenders: $lenders, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FireBookModelImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.googleId, googleId) ||
                other.googleId == googleId) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.bookImage, bookImage) ||
                other.bookImage == bookImage) &&
            (identical(other.bookDescription, bookDescription) ||
                other.bookDescription == bookDescription) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.authors, authors) || other.authors == authors) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._lenders, _lenders) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookId,
      googleId,
      bookName,
      bookImage,
      bookDescription,
      rating,
      ratingCount,
      publishedDate,
      authors,
      pageCount,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_lenders),
      quantity);

  /// Create a copy of FireBookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FireBookModelImplCopyWith<_$FireBookModelImpl> get copyWith =>
      __$$FireBookModelImplCopyWithImpl<_$FireBookModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FireBookModelImplToJson(
      this,
    );
  }
}

abstract class _FireBookModel implements FireBookModel {
  factory _FireBookModel(
      {final String? bookId,
      final String? googleId,
      final String? bookName,
      final String? bookImage,
      final String? bookDescription,
      final double? rating,
      final int? ratingCount,
      final String? publishedDate,
      final String? authors,
      final int? pageCount,
      final List<String>? categories,
      final List<String>? lenders,
      final int? quantity}) = _$FireBookModelImpl;

  factory _FireBookModel.fromJson(Map<String, dynamic> json) =
      _$FireBookModelImpl.fromJson;

  @override
  String? get bookId;
  @override
  String? get googleId;
  @override
  String? get bookName;
  @override
  String? get bookImage;
  @override
  String? get bookDescription;
  @override
  double? get rating;
  @override
  int? get ratingCount;
  @override
  String? get publishedDate;
  @override
  String? get authors;
  @override
  int? get pageCount;
  @override
  List<String>? get categories;
  @override
  List<String>? get lenders;
  @override
  int? get quantity;

  /// Create a copy of FireBookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FireBookModelImplCopyWith<_$FireBookModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  String? get reviewId => throw _privateConstructorUsedError;
  String? get studentId => throw _privateConstructorUsedError;
  String? get studentName => throw _privateConstructorUsedError;
  String? get reviewString => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {String? reviewId,
      String? studentId,
      String? studentName,
      String? reviewString,
      double? rating});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? reviewString = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewString: freezed == reviewString
          ? _value.reviewString
          : reviewString // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reviewId,
      String? studentId,
      String? studentName,
      String? reviewString,
      double? rating});
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? reviewString = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$ReviewModelImpl(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewString: freezed == reviewString
          ? _value.reviewString
          : reviewString // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl implements _ReviewModel {
  _$ReviewModelImpl(
      {this.reviewId,
      this.studentId,
      this.studentName,
      this.reviewString,
      this.rating});

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  final String? reviewId;
  @override
  final String? studentId;
  @override
  final String? studentName;
  @override
  final String? reviewString;
  @override
  final double? rating;

  @override
  String toString() {
    return 'ReviewModel(reviewId: $reviewId, studentId: $studentId, studentName: $studentName, reviewString: $reviewString, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.reviewString, reviewString) ||
                other.reviewString == reviewString) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, reviewId, studentId, studentName, reviewString, rating);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  factory _ReviewModel(
      {final String? reviewId,
      final String? studentId,
      final String? studentName,
      final String? reviewString,
      final double? rating}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  String? get reviewId;
  @override
  String? get studentId;
  @override
  String? get studentName;
  @override
  String? get reviewString;
  @override
  double? get rating;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookStatusDetail _$BookStatusDetailFromJson(Map<String, dynamic> json) {
  return _BookStatusDetail.fromJson(json);
}

/// @nodoc
mixin _$BookStatusDetail {
  int? get bookNumber => throw _privateConstructorUsedError;
  String? get bookStatus => throw _privateConstructorUsedError;
  DateTime? get bookIssuedDate => throw _privateConstructorUsedError;
  DateTime? get bookReceivingDate => throw _privateConstructorUsedError;

  /// Serializes this BookStatusDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookStatusDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookStatusDetailCopyWith<BookStatusDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookStatusDetailCopyWith<$Res> {
  factory $BookStatusDetailCopyWith(
          BookStatusDetail value, $Res Function(BookStatusDetail) then) =
      _$BookStatusDetailCopyWithImpl<$Res, BookStatusDetail>;
  @useResult
  $Res call(
      {int? bookNumber,
      String? bookStatus,
      DateTime? bookIssuedDate,
      DateTime? bookReceivingDate});
}

/// @nodoc
class _$BookStatusDetailCopyWithImpl<$Res, $Val extends BookStatusDetail>
    implements $BookStatusDetailCopyWith<$Res> {
  _$BookStatusDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookStatusDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookNumber = freezed,
    Object? bookStatus = freezed,
    Object? bookIssuedDate = freezed,
    Object? bookReceivingDate = freezed,
  }) {
    return _then(_value.copyWith(
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      bookStatus: freezed == bookStatus
          ? _value.bookStatus
          : bookStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bookIssuedDate: freezed == bookIssuedDate
          ? _value.bookIssuedDate
          : bookIssuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookReceivingDate: freezed == bookReceivingDate
          ? _value.bookReceivingDate
          : bookReceivingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookStatusDetailImplCopyWith<$Res>
    implements $BookStatusDetailCopyWith<$Res> {
  factory _$$BookStatusDetailImplCopyWith(_$BookStatusDetailImpl value,
          $Res Function(_$BookStatusDetailImpl) then) =
      __$$BookStatusDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? bookNumber,
      String? bookStatus,
      DateTime? bookIssuedDate,
      DateTime? bookReceivingDate});
}

/// @nodoc
class __$$BookStatusDetailImplCopyWithImpl<$Res>
    extends _$BookStatusDetailCopyWithImpl<$Res, _$BookStatusDetailImpl>
    implements _$$BookStatusDetailImplCopyWith<$Res> {
  __$$BookStatusDetailImplCopyWithImpl(_$BookStatusDetailImpl _value,
      $Res Function(_$BookStatusDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookStatusDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookNumber = freezed,
    Object? bookStatus = freezed,
    Object? bookIssuedDate = freezed,
    Object? bookReceivingDate = freezed,
  }) {
    return _then(_$BookStatusDetailImpl(
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      bookStatus: freezed == bookStatus
          ? _value.bookStatus
          : bookStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bookIssuedDate: freezed == bookIssuedDate
          ? _value.bookIssuedDate
          : bookIssuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookReceivingDate: freezed == bookReceivingDate
          ? _value.bookReceivingDate
          : bookReceivingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookStatusDetailImpl implements _BookStatusDetail {
  _$BookStatusDetailImpl(
      {this.bookNumber,
      this.bookStatus,
      this.bookIssuedDate,
      this.bookReceivingDate});

  factory _$BookStatusDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookStatusDetailImplFromJson(json);

  @override
  final int? bookNumber;
  @override
  final String? bookStatus;
  @override
  final DateTime? bookIssuedDate;
  @override
  final DateTime? bookReceivingDate;

  @override
  String toString() {
    return 'BookStatusDetail(bookNumber: $bookNumber, bookStatus: $bookStatus, bookIssuedDate: $bookIssuedDate, bookReceivingDate: $bookReceivingDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookStatusDetailImpl &&
            (identical(other.bookNumber, bookNumber) ||
                other.bookNumber == bookNumber) &&
            (identical(other.bookStatus, bookStatus) ||
                other.bookStatus == bookStatus) &&
            (identical(other.bookIssuedDate, bookIssuedDate) ||
                other.bookIssuedDate == bookIssuedDate) &&
            (identical(other.bookReceivingDate, bookReceivingDate) ||
                other.bookReceivingDate == bookReceivingDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookNumber, bookStatus, bookIssuedDate, bookReceivingDate);

  /// Create a copy of BookStatusDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookStatusDetailImplCopyWith<_$BookStatusDetailImpl> get copyWith =>
      __$$BookStatusDetailImplCopyWithImpl<_$BookStatusDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookStatusDetailImplToJson(
      this,
    );
  }
}

abstract class _BookStatusDetail implements BookStatusDetail {
  factory _BookStatusDetail(
      {final int? bookNumber,
      final String? bookStatus,
      final DateTime? bookIssuedDate,
      final DateTime? bookReceivingDate}) = _$BookStatusDetailImpl;

  factory _BookStatusDetail.fromJson(Map<String, dynamic> json) =
      _$BookStatusDetailImpl.fromJson;

  @override
  int? get bookNumber;
  @override
  String? get bookStatus;
  @override
  DateTime? get bookIssuedDate;
  @override
  DateTime? get bookReceivingDate;

  /// Create a copy of BookStatusDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookStatusDetailImplCopyWith<_$BookStatusDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
