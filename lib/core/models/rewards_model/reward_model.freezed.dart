// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) {
  return _RewardModel.fromJson(json);
}

/// @nodoc
mixin _$RewardModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get pointsRequired => throw _privateConstructorUsedError;
  List<RewardClaimUser>? get claimByUsers => throw _privateConstructorUsedError;
  List<RewardClaim>? get claimedBy => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this RewardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardModelCopyWith<RewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardModelCopyWith<$Res> {
  factory $RewardModelCopyWith(
          RewardModel value, $Res Function(RewardModel) then) =
      _$RewardModelCopyWithImpl<$Res, RewardModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      double? pointsRequired,
      List<RewardClaimUser>? claimByUsers,
      List<RewardClaim>? claimedBy,
      String? imageUrl});
}

/// @nodoc
class _$RewardModelCopyWithImpl<$Res, $Val extends RewardModel>
    implements $RewardModelCopyWith<$Res> {
  _$RewardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pointsRequired = freezed,
    Object? claimByUsers = freezed,
    Object? claimedBy = freezed,
    Object? imageUrl = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsRequired: freezed == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as double?,
      claimByUsers: freezed == claimByUsers
          ? _value.claimByUsers
          : claimByUsers // ignore: cast_nullable_to_non_nullable
              as List<RewardClaimUser>?,
      claimedBy: freezed == claimedBy
          ? _value.claimedBy
          : claimedBy // ignore: cast_nullable_to_non_nullable
              as List<RewardClaim>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardModelImplCopyWith<$Res>
    implements $RewardModelCopyWith<$Res> {
  factory _$$RewardModelImplCopyWith(
          _$RewardModelImpl value, $Res Function(_$RewardModelImpl) then) =
      __$$RewardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      double? pointsRequired,
      List<RewardClaimUser>? claimByUsers,
      List<RewardClaim>? claimedBy,
      String? imageUrl});
}

/// @nodoc
class __$$RewardModelImplCopyWithImpl<$Res>
    extends _$RewardModelCopyWithImpl<$Res, _$RewardModelImpl>
    implements _$$RewardModelImplCopyWith<$Res> {
  __$$RewardModelImplCopyWithImpl(
      _$RewardModelImpl _value, $Res Function(_$RewardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pointsRequired = freezed,
    Object? claimByUsers = freezed,
    Object? claimedBy = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$RewardModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsRequired: freezed == pointsRequired
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as double?,
      claimByUsers: freezed == claimByUsers
          ? _value._claimByUsers
          : claimByUsers // ignore: cast_nullable_to_non_nullable
              as List<RewardClaimUser>?,
      claimedBy: freezed == claimedBy
          ? _value._claimedBy
          : claimedBy // ignore: cast_nullable_to_non_nullable
              as List<RewardClaim>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardModelImpl implements _RewardModel {
  const _$RewardModelImpl(
      {this.id,
      this.name,
      this.description,
      this.pointsRequired,
      final List<RewardClaimUser>? claimByUsers,
      final List<RewardClaim>? claimedBy,
      this.imageUrl})
      : _claimByUsers = claimByUsers,
        _claimedBy = claimedBy;

  factory _$RewardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? pointsRequired;
  final List<RewardClaimUser>? _claimByUsers;
  @override
  List<RewardClaimUser>? get claimByUsers {
    final value = _claimByUsers;
    if (value == null) return null;
    if (_claimByUsers is EqualUnmodifiableListView) return _claimByUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RewardClaim>? _claimedBy;
  @override
  List<RewardClaim>? get claimedBy {
    final value = _claimedBy;
    if (value == null) return null;
    if (_claimedBy is EqualUnmodifiableListView) return _claimedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'RewardModel(id: $id, name: $name, description: $description, pointsRequired: $pointsRequired, claimByUsers: $claimByUsers, claimedBy: $claimedBy, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pointsRequired, pointsRequired) ||
                other.pointsRequired == pointsRequired) &&
            const DeepCollectionEquality()
                .equals(other._claimByUsers, _claimByUsers) &&
            const DeepCollectionEquality()
                .equals(other._claimedBy, _claimedBy) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      pointsRequired,
      const DeepCollectionEquality().hash(_claimByUsers),
      const DeepCollectionEquality().hash(_claimedBy),
      imageUrl);

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      __$$RewardModelImplCopyWithImpl<_$RewardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardModelImplToJson(
      this,
    );
  }
}

abstract class _RewardModel implements RewardModel {
  const factory _RewardModel(
      {final String? id,
      final String? name,
      final String? description,
      final double? pointsRequired,
      final List<RewardClaimUser>? claimByUsers,
      final List<RewardClaim>? claimedBy,
      final String? imageUrl}) = _$RewardModelImpl;

  factory _RewardModel.fromJson(Map<String, dynamic> json) =
      _$RewardModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get pointsRequired;
  @override
  List<RewardClaimUser>? get claimByUsers;
  @override
  List<RewardClaim>? get claimedBy;
  @override
  String? get imageUrl;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RewardClaimUser _$RewardClaimUserFromJson(Map<String, dynamic> json) {
  return _RewardClaimUser.fromJson(json);
}

/// @nodoc
mixin _$RewardClaimUser {
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  /// Serializes this RewardClaimUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardClaimUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardClaimUserCopyWith<RewardClaimUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardClaimUserCopyWith<$Res> {
  factory $RewardClaimUserCopyWith(
          RewardClaimUser value, $Res Function(RewardClaimUser) then) =
      _$RewardClaimUserCopyWithImpl<$Res, RewardClaimUser>;
  @useResult
  $Res call({String? userId, String? userName});
}

/// @nodoc
class _$RewardClaimUserCopyWithImpl<$Res, $Val extends RewardClaimUser>
    implements $RewardClaimUserCopyWith<$Res> {
  _$RewardClaimUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardClaimUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardClaimUserImplCopyWith<$Res>
    implements $RewardClaimUserCopyWith<$Res> {
  factory _$$RewardClaimUserImplCopyWith(_$RewardClaimUserImpl value,
          $Res Function(_$RewardClaimUserImpl) then) =
      __$$RewardClaimUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? userName});
}

/// @nodoc
class __$$RewardClaimUserImplCopyWithImpl<$Res>
    extends _$RewardClaimUserCopyWithImpl<$Res, _$RewardClaimUserImpl>
    implements _$$RewardClaimUserImplCopyWith<$Res> {
  __$$RewardClaimUserImplCopyWithImpl(
      _$RewardClaimUserImpl _value, $Res Function(_$RewardClaimUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardClaimUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$RewardClaimUserImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardClaimUserImpl implements _RewardClaimUser {
  const _$RewardClaimUserImpl({this.userId, this.userName});

  factory _$RewardClaimUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardClaimUserImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? userName;

  @override
  String toString() {
    return 'RewardClaimUser(userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardClaimUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName);

  /// Create a copy of RewardClaimUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardClaimUserImplCopyWith<_$RewardClaimUserImpl> get copyWith =>
      __$$RewardClaimUserImplCopyWithImpl<_$RewardClaimUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardClaimUserImplToJson(
      this,
    );
  }
}

abstract class _RewardClaimUser implements RewardClaimUser {
  const factory _RewardClaimUser(
      {final String? userId, final String? userName}) = _$RewardClaimUserImpl;

  factory _RewardClaimUser.fromJson(Map<String, dynamic> json) =
      _$RewardClaimUserImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get userName;

  /// Create a copy of RewardClaimUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardClaimUserImplCopyWith<_$RewardClaimUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RewardClaim _$RewardClaimFromJson(Map<String, dynamic> json) {
  return _RewardClaim.fromJson(json);
}

/// @nodoc
mixin _$RewardClaim {
  String? get rid => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get claimStatus => throw _privateConstructorUsedError;
  double? get rewardPoints => throw _privateConstructorUsedError;
  DateTime? get claimedAt => throw _privateConstructorUsedError;

  /// Serializes this RewardClaim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardClaim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardClaimCopyWith<RewardClaim> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardClaimCopyWith<$Res> {
  factory $RewardClaimCopyWith(
          RewardClaim value, $Res Function(RewardClaim) then) =
      _$RewardClaimCopyWithImpl<$Res, RewardClaim>;
  @useResult
  $Res call(
      {String? rid,
      String? userId,
      String? userName,
      String? claimStatus,
      double? rewardPoints,
      DateTime? claimedAt});
}

/// @nodoc
class _$RewardClaimCopyWithImpl<$Res, $Val extends RewardClaim>
    implements $RewardClaimCopyWith<$Res> {
  _$RewardClaimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardClaim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rid = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? claimStatus = freezed,
    Object? rewardPoints = freezed,
    Object? claimedAt = freezed,
  }) {
    return _then(_value.copyWith(
      rid: freezed == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      claimStatus: freezed == claimStatus
          ? _value.claimStatus
          : claimStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardPoints: freezed == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardClaimImplCopyWith<$Res>
    implements $RewardClaimCopyWith<$Res> {
  factory _$$RewardClaimImplCopyWith(
          _$RewardClaimImpl value, $Res Function(_$RewardClaimImpl) then) =
      __$$RewardClaimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? rid,
      String? userId,
      String? userName,
      String? claimStatus,
      double? rewardPoints,
      DateTime? claimedAt});
}

/// @nodoc
class __$$RewardClaimImplCopyWithImpl<$Res>
    extends _$RewardClaimCopyWithImpl<$Res, _$RewardClaimImpl>
    implements _$$RewardClaimImplCopyWith<$Res> {
  __$$RewardClaimImplCopyWithImpl(
      _$RewardClaimImpl _value, $Res Function(_$RewardClaimImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardClaim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rid = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? claimStatus = freezed,
    Object? rewardPoints = freezed,
    Object? claimedAt = freezed,
  }) {
    return _then(_$RewardClaimImpl(
      rid: freezed == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      claimStatus: freezed == claimStatus
          ? _value.claimStatus
          : claimStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardPoints: freezed == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      claimedAt: freezed == claimedAt
          ? _value.claimedAt
          : claimedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardClaimImpl implements _RewardClaim {
  const _$RewardClaimImpl(
      {this.rid,
      this.userId,
      this.userName,
      this.claimStatus,
      this.rewardPoints,
      this.claimedAt});

  factory _$RewardClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardClaimImplFromJson(json);

  @override
  final String? rid;
  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final String? claimStatus;
  @override
  final double? rewardPoints;
  @override
  final DateTime? claimedAt;

  @override
  String toString() {
    return 'RewardClaim(rid: $rid, userId: $userId, userName: $userName, claimStatus: $claimStatus, rewardPoints: $rewardPoints, claimedAt: $claimedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardClaimImpl &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.claimStatus, claimStatus) ||
                other.claimStatus == claimStatus) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints) &&
            (identical(other.claimedAt, claimedAt) ||
                other.claimedAt == claimedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rid, userId, userName, claimStatus, rewardPoints, claimedAt);

  /// Create a copy of RewardClaim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardClaimImplCopyWith<_$RewardClaimImpl> get copyWith =>
      __$$RewardClaimImplCopyWithImpl<_$RewardClaimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardClaimImplToJson(
      this,
    );
  }
}

abstract class _RewardClaim implements RewardClaim {
  const factory _RewardClaim(
      {final String? rid,
      final String? userId,
      final String? userName,
      final String? claimStatus,
      final double? rewardPoints,
      final DateTime? claimedAt}) = _$RewardClaimImpl;

  factory _RewardClaim.fromJson(Map<String, dynamic> json) =
      _$RewardClaimImpl.fromJson;

  @override
  String? get rid;
  @override
  String? get userId;
  @override
  String? get userName;
  @override
  String? get claimStatus;
  @override
  double? get rewardPoints;
  @override
  DateTime? get claimedAt;

  /// Create a copy of RewardClaim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardClaimImplCopyWith<_$RewardClaimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
