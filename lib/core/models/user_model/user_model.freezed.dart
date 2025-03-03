// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  double? get rewardPoints => throw _privateConstructorUsedError;
  List<String>? get favourites => throw _privateConstructorUsedError;
  List<String>? get borrowedBookList => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? bio,
      double? rewardPoints,
      List<String>? favourites,
      List<String>? borrowedBookList,
      String? profilePicture,
      String? role});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? rewardPoints = freezed,
    Object? favourites = freezed,
    Object? borrowedBookList = freezed,
    Object? profilePicture = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardPoints: freezed == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      borrowedBookList: freezed == borrowedBookList
          ? _value.borrowedBookList
          : borrowedBookList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? bio,
      double? rewardPoints,
      List<String>? favourites,
      List<String>? borrowedBookList,
      String? profilePicture,
      String? role});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? rewardPoints = freezed,
    Object? favourites = freezed,
    Object? borrowedBookList = freezed,
    Object? profilePicture = freezed,
    Object? role = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardPoints: freezed == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      favourites: freezed == favourites
          ? _value._favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      borrowedBookList: freezed == borrowedBookList
          ? _value._borrowedBookList
          : borrowedBookList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {this.id,
      this.name,
      this.email,
      this.bio,
      this.rewardPoints,
      final List<String>? favourites,
      final List<String>? borrowedBookList,
      this.profilePicture,
      this.role})
      : _favourites = favourites,
        _borrowedBookList = borrowedBookList;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? bio;
  @override
  final double? rewardPoints;
  final List<String>? _favourites;
  @override
  List<String>? get favourites {
    final value = _favourites;
    if (value == null) return null;
    if (_favourites is EqualUnmodifiableListView) return _favourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _borrowedBookList;
  @override
  List<String>? get borrowedBookList {
    final value = _borrowedBookList;
    if (value == null) return null;
    if (_borrowedBookList is EqualUnmodifiableListView)
      return _borrowedBookList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? profilePicture;
  @override
  final String? role;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, bio: $bio, rewardPoints: $rewardPoints, favourites: $favourites, borrowedBookList: $borrowedBookList, profilePicture: $profilePicture, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints) &&
            const DeepCollectionEquality()
                .equals(other._favourites, _favourites) &&
            const DeepCollectionEquality()
                .equals(other._borrowedBookList, _borrowedBookList) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      bio,
      rewardPoints,
      const DeepCollectionEquality().hash(_favourites),
      const DeepCollectionEquality().hash(_borrowedBookList),
      profilePicture,
      role);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String? id,
      final String? name,
      final String? email,
      final String? bio,
      final double? rewardPoints,
      final List<String>? favourites,
      final List<String>? borrowedBookList,
      final String? profilePicture,
      final String? role}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get bio;
  @override
  double? get rewardPoints;
  @override
  List<String>? get favourites;
  @override
  List<String>? get borrowedBookList;
  @override
  String? get profilePicture;
  @override
  String? get role;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookLendedHistory _$BookLendedHistoryFromJson(Map<String, dynamic> json) {
  return _BookLendedHistory.fromJson(json);
}

/// @nodoc
mixin _$BookLendedHistory {
  String? get bookLendId => throw _privateConstructorUsedError;
  String? get bookId => throw _privateConstructorUsedError;
  String? get studentId => throw _privateConstructorUsedError;
  String? get lenderId => throw _privateConstructorUsedError;
  String? get bookNumber => throw _privateConstructorUsedError;
  DateTime? get bookIssuedDate => throw _privateConstructorUsedError;
  DateTime? get bookDueDate => throw _privateConstructorUsedError;
  DateTime? get bookReturnedDate => throw _privateConstructorUsedError;
  String? get bookIssueStatus => throw _privateConstructorUsedError;

  /// Serializes this BookLendedHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookLendedHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookLendedHistoryCopyWith<BookLendedHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookLendedHistoryCopyWith<$Res> {
  factory $BookLendedHistoryCopyWith(
          BookLendedHistory value, $Res Function(BookLendedHistory) then) =
      _$BookLendedHistoryCopyWithImpl<$Res, BookLendedHistory>;
  @useResult
  $Res call(
      {String? bookLendId,
      String? bookId,
      String? studentId,
      String? lenderId,
      String? bookNumber,
      DateTime? bookIssuedDate,
      DateTime? bookDueDate,
      DateTime? bookReturnedDate,
      String? bookIssueStatus});
}

/// @nodoc
class _$BookLendedHistoryCopyWithImpl<$Res, $Val extends BookLendedHistory>
    implements $BookLendedHistoryCopyWith<$Res> {
  _$BookLendedHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookLendedHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookLendId = freezed,
    Object? bookId = freezed,
    Object? studentId = freezed,
    Object? lenderId = freezed,
    Object? bookNumber = freezed,
    Object? bookIssuedDate = freezed,
    Object? bookDueDate = freezed,
    Object? bookReturnedDate = freezed,
    Object? bookIssueStatus = freezed,
  }) {
    return _then(_value.copyWith(
      bookLendId: freezed == bookLendId
          ? _value.bookLendId
          : bookLendId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lenderId: freezed == lenderId
          ? _value.lenderId
          : lenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bookIssuedDate: freezed == bookIssuedDate
          ? _value.bookIssuedDate
          : bookIssuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookDueDate: freezed == bookDueDate
          ? _value.bookDueDate
          : bookDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookReturnedDate: freezed == bookReturnedDate
          ? _value.bookReturnedDate
          : bookReturnedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookIssueStatus: freezed == bookIssueStatus
          ? _value.bookIssueStatus
          : bookIssueStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookLendedHistoryImplCopyWith<$Res>
    implements $BookLendedHistoryCopyWith<$Res> {
  factory _$$BookLendedHistoryImplCopyWith(_$BookLendedHistoryImpl value,
          $Res Function(_$BookLendedHistoryImpl) then) =
      __$$BookLendedHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookLendId,
      String? bookId,
      String? studentId,
      String? lenderId,
      String? bookNumber,
      DateTime? bookIssuedDate,
      DateTime? bookDueDate,
      DateTime? bookReturnedDate,
      String? bookIssueStatus});
}

/// @nodoc
class __$$BookLendedHistoryImplCopyWithImpl<$Res>
    extends _$BookLendedHistoryCopyWithImpl<$Res, _$BookLendedHistoryImpl>
    implements _$$BookLendedHistoryImplCopyWith<$Res> {
  __$$BookLendedHistoryImplCopyWithImpl(_$BookLendedHistoryImpl _value,
      $Res Function(_$BookLendedHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookLendedHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookLendId = freezed,
    Object? bookId = freezed,
    Object? studentId = freezed,
    Object? lenderId = freezed,
    Object? bookNumber = freezed,
    Object? bookIssuedDate = freezed,
    Object? bookDueDate = freezed,
    Object? bookReturnedDate = freezed,
    Object? bookIssueStatus = freezed,
  }) {
    return _then(_$BookLendedHistoryImpl(
      bookLendId: freezed == bookLendId
          ? _value.bookLendId
          : bookLendId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      lenderId: freezed == lenderId
          ? _value.lenderId
          : lenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookNumber: freezed == bookNumber
          ? _value.bookNumber
          : bookNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bookIssuedDate: freezed == bookIssuedDate
          ? _value.bookIssuedDate
          : bookIssuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookDueDate: freezed == bookDueDate
          ? _value.bookDueDate
          : bookDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookReturnedDate: freezed == bookReturnedDate
          ? _value.bookReturnedDate
          : bookReturnedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bookIssueStatus: freezed == bookIssueStatus
          ? _value.bookIssueStatus
          : bookIssueStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookLendedHistoryImpl implements _BookLendedHistory {
  _$BookLendedHistoryImpl(
      {this.bookLendId,
      this.bookId,
      this.studentId,
      this.lenderId,
      this.bookNumber,
      this.bookIssuedDate,
      this.bookDueDate,
      this.bookReturnedDate,
      this.bookIssueStatus});

  factory _$BookLendedHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookLendedHistoryImplFromJson(json);

  @override
  final String? bookLendId;
  @override
  final String? bookId;
  @override
  final String? studentId;
  @override
  final String? lenderId;
  @override
  final String? bookNumber;
  @override
  final DateTime? bookIssuedDate;
  @override
  final DateTime? bookDueDate;
  @override
  final DateTime? bookReturnedDate;
  @override
  final String? bookIssueStatus;

  @override
  String toString() {
    return 'BookLendedHistory(bookLendId: $bookLendId, bookId: $bookId, studentId: $studentId, lenderId: $lenderId, bookNumber: $bookNumber, bookIssuedDate: $bookIssuedDate, bookDueDate: $bookDueDate, bookReturnedDate: $bookReturnedDate, bookIssueStatus: $bookIssueStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookLendedHistoryImpl &&
            (identical(other.bookLendId, bookLendId) ||
                other.bookLendId == bookLendId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.lenderId, lenderId) ||
                other.lenderId == lenderId) &&
            (identical(other.bookNumber, bookNumber) ||
                other.bookNumber == bookNumber) &&
            (identical(other.bookIssuedDate, bookIssuedDate) ||
                other.bookIssuedDate == bookIssuedDate) &&
            (identical(other.bookDueDate, bookDueDate) ||
                other.bookDueDate == bookDueDate) &&
            (identical(other.bookReturnedDate, bookReturnedDate) ||
                other.bookReturnedDate == bookReturnedDate) &&
            (identical(other.bookIssueStatus, bookIssueStatus) ||
                other.bookIssueStatus == bookIssueStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookLendId,
      bookId,
      studentId,
      lenderId,
      bookNumber,
      bookIssuedDate,
      bookDueDate,
      bookReturnedDate,
      bookIssueStatus);

  /// Create a copy of BookLendedHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookLendedHistoryImplCopyWith<_$BookLendedHistoryImpl> get copyWith =>
      __$$BookLendedHistoryImplCopyWithImpl<_$BookLendedHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookLendedHistoryImplToJson(
      this,
    );
  }
}

abstract class _BookLendedHistory implements BookLendedHistory {
  factory _BookLendedHistory(
      {final String? bookLendId,
      final String? bookId,
      final String? studentId,
      final String? lenderId,
      final String? bookNumber,
      final DateTime? bookIssuedDate,
      final DateTime? bookDueDate,
      final DateTime? bookReturnedDate,
      final String? bookIssueStatus}) = _$BookLendedHistoryImpl;

  factory _BookLendedHistory.fromJson(Map<String, dynamic> json) =
      _$BookLendedHistoryImpl.fromJson;

  @override
  String? get bookLendId;
  @override
  String? get bookId;
  @override
  String? get studentId;
  @override
  String? get lenderId;
  @override
  String? get bookNumber;
  @override
  DateTime? get bookIssuedDate;
  @override
  DateTime? get bookDueDate;
  @override
  DateTime? get bookReturnedDate;
  @override
  String? get bookIssueStatus;

  /// Create a copy of BookLendedHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookLendedHistoryImplCopyWith<_$BookLendedHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
