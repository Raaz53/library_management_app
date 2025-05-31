// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_return_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookReturnModel _$BookReturnModelFromJson(Map<String, dynamic> json) {
  return _BookReturnModel.fromJson(json);
}

/// @nodoc
mixin _$BookReturnModel {
  String? get lendId => throw _privateConstructorUsedError;
  String? get bookId => throw _privateConstructorUsedError;
  String? get bookNumber => throw _privateConstructorUsedError;
  String? get returnedDate => throw _privateConstructorUsedError;

  /// Serializes this BookReturnModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookReturnModelCopyWith<BookReturnModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookReturnModelCopyWith<$Res> {
  factory $BookReturnModelCopyWith(
          BookReturnModel value, $Res Function(BookReturnModel) then) =
      _$BookReturnModelCopyWithImpl<$Res, BookReturnModel>;
  @useResult
  $Res call(
      {String? lendId,
      String? bookId,
      String? bookNumber,
      String? returnedDate});
}

/// @nodoc
class _$BookReturnModelCopyWithImpl<$Res, $Val extends BookReturnModel>
    implements $BookReturnModelCopyWith<$Res> {
  _$BookReturnModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lendId = freezed,
    Object? bookId = freezed,
    Object? bookNumber = freezed,
    Object? returnedDate = freezed,
  }) {
    return _then(_value.copyWith(
      lendId: freezed == lendId
          ? _value.lendId
          : lendId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      returnedDate: freezed == returnedDate
          ? _value.returnedDate
          : returnedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookReturnModelImplCopyWith<$Res>
    implements $BookReturnModelCopyWith<$Res> {
  factory _$$BookReturnModelImplCopyWith(_$BookReturnModelImpl value,
          $Res Function(_$BookReturnModelImpl) then) =
      __$$BookReturnModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? lendId,
      String? bookId,
      String? bookNumber,
      String? returnedDate});
}

/// @nodoc
class __$$BookReturnModelImplCopyWithImpl<$Res>
    extends _$BookReturnModelCopyWithImpl<$Res, _$BookReturnModelImpl>
    implements _$$BookReturnModelImplCopyWith<$Res> {
  __$$BookReturnModelImplCopyWithImpl(
      _$BookReturnModelImpl _value, $Res Function(_$BookReturnModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lendId = freezed,
    Object? bookId = freezed,
    Object? bookNumber = freezed,
    Object? returnedDate = freezed,
  }) {
    return _then(_$BookReturnModelImpl(
      lendId: freezed == lendId
          ? _value.lendId
          : lendId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      returnedDate: freezed == returnedDate
          ? _value.returnedDate
          : returnedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookReturnModelImpl implements _BookReturnModel {
  _$BookReturnModelImpl(
      {this.lendId, this.bookId, this.bookNumber, this.returnedDate});

  factory _$BookReturnModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookReturnModelImplFromJson(json);

  @override
  final String? lendId;
  @override
  final String? bookId;
  @override
  final String? bookNumber;
  @override
  final String? returnedDate;

  @override
  String toString() {
    return 'BookReturnModel(lendId: $lendId, bookId: $bookId, bookNumber: $bookNumber, returnedDate: $returnedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookReturnModelImpl &&
            (identical(other.lendId, lendId) || other.lendId == lendId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookNumber, bookNumber) ||
                other.bookNumber == bookNumber) &&
            (identical(other.returnedDate, returnedDate) ||
                other.returnedDate == returnedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lendId, bookId, bookNumber, returnedDate);

  /// Create a copy of BookReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookReturnModelImplCopyWith<_$BookReturnModelImpl> get copyWith =>
      __$$BookReturnModelImplCopyWithImpl<_$BookReturnModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookReturnModelImplToJson(
      this,
    );
  }
}

abstract class _BookReturnModel implements BookReturnModel {
  factory _BookReturnModel(
      {final String? lendId,
      final String? bookId,
      final String? bookNumber,
      final String? returnedDate}) = _$BookReturnModelImpl;

  factory _BookReturnModel.fromJson(Map<String, dynamic> json) =
      _$BookReturnModelImpl.fromJson;

  @override
  String? get lendId;
  @override
  String? get bookId;
  @override
  String? get bookNumber;
  @override
  String? get returnedDate;

  /// Create a copy of BookReturnModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookReturnModelImplCopyWith<_$BookReturnModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
