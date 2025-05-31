import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/resources/assets.dart';
import '../cubit/check_claimable_cubit/check_claimable_cubit.dart';

class SingleRewardItemWidget extends StatefulWidget {
  const SingleRewardItemWidget(
      {super.key,
      this.rewardName,
      this.rewardDescription,
      this.rewardImage,
      this.rewardPoints,
      required this.onTap,
      this.rewardId,
      this.currentPoints});

  final String? rewardName;
  final String? rewardId;
  final String? rewardDescription;
  final double? rewardPoints;
  final double? currentPoints;
  final String? rewardImage;
  final VoidCallback onTap;

  @override
  State<SingleRewardItemWidget> createState() => _SingleRewardItemWidgetState();
}

class _SingleRewardItemWidgetState extends State<SingleRewardItemWidget> {
  late CheckClaimableCubit _checkClaimableCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Opacity(
          opacity: (globalUserRole == UserRole.user
                  ? (widget.currentPoints ?? 0) >= (widget.rewardPoints ?? 0)
                  : true)
              ? 1.0
              : 0.5,
          child: Container(
            color: AppColors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withValues(alpha: 0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                    color: AppColors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          widget.rewardImage ?? ImageAssets.bookmarkImg,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Cost: ',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.rewardPoints?.toString() ?? '20',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.rewardName ?? 'Reward Item',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.rewardDescription ??
                      'Description of the reward item goes here.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
