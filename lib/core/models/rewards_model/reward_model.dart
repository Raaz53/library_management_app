import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.freezed.dart';
part 'reward_model.g.dart';

@freezed
class RewardModel with _$RewardModel {
  const factory RewardModel({
    String? id,
    String? name,
    String? description,
    double? pointsRequired,
    List<RewardClaimUser>? claimByUsers,
    List<RewardClaim>? claimedBy,
    String? imageUrl,
  }) = _RewardModel;

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
}

@freezed
class RewardClaimUser with _$RewardClaimUser {
  const factory RewardClaimUser({
    String? userId,
    String? userName,
  }) = _RewardClaimUser;

  factory RewardClaimUser.fromJson(Map<String, dynamic> json) =>
      _$RewardClaimUserFromJson(json);
}

@freezed
class RewardClaim with _$RewardClaim {
  const factory RewardClaim({
    String? rid,
    String? userId,
    String? userName,
    String? claimStatus,
    double? rewardPoints,
    DateTime? claimedAt,
  }) = _RewardClaim;

  factory RewardClaim.fromJson(Map<String, dynamic> json) =>
      _$RewardClaimFromJson(json);
}
