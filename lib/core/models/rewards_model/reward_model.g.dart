// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardModelImpl _$$RewardModelImplFromJson(Map<String, dynamic> json) =>
    _$RewardModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      pointsRequired: (json['pointsRequired'] as num?)?.toDouble(),
      claimByUsers: (json['claimByUsers'] as List<dynamic>?)
          ?.map((e) => RewardClaimUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      claimedBy: (json['claimedBy'] as List<dynamic>?)
          ?.map((e) => RewardClaim.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$RewardModelImplToJson(_$RewardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pointsRequired': instance.pointsRequired,
      'claimByUsers': instance.claimByUsers,
      'claimedBy': instance.claimedBy,
      'imageUrl': instance.imageUrl,
    };

_$RewardClaimUserImpl _$$RewardClaimUserImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardClaimUserImpl(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$RewardClaimUserImplToJson(
        _$RewardClaimUserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
    };

_$RewardClaimImpl _$$RewardClaimImplFromJson(Map<String, dynamic> json) =>
    _$RewardClaimImpl(
      rid: json['rid'] as String?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      claimStatus: json['claimStatus'] as String?,
      rewardPoints: (json['rewardPoints'] as num?)?.toDouble(),
      claimedAt: json['claimedAt'] == null
          ? null
          : DateTime.parse(json['claimedAt'] as String),
    );

Map<String, dynamic> _$$RewardClaimImplToJson(_$RewardClaimImpl instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'userId': instance.userId,
      'userName': instance.userName,
      'claimStatus': instance.claimStatus,
      'rewardPoints': instance.rewardPoints,
      'claimedAt': instance.claimedAt?.toIso8601String(),
    };
