import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({super.key, this.reviews});
  final List<ReviewModel>? reviews;

  @override
  State<ReviewsListWidget> createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  late List<ReviewModel>? reviews;
  @override
  void initState() {
    super.initState();
    reviews = widget.reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: AppTextStyles.headlineMediumMonserat
              .copyWith(fontWeight: FontWeight.bold),
        ),
        10.verticalBox,
        if (reviews?.isEmpty ?? false)
          Text(
            'No reviews yet',
            style: AppTextStyles.bodyMediumMonserat
                .copyWith(color: AppColors.white.withValues(alpha: 0.5)),
          ),
        10.verticalBox,
        if (reviews != null)
          for (final review in reviews!)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        ImageAssets.profileImg,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    5.horizontalBox,
                    Text(
                      review.studentName ?? 'Anonymous',
                      style: AppTextStyles.bodySmallMonserat.copyWith(
                        color: AppColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                10.verticalBox,
                Text(
                  review.reviewString ?? '',
                  style: AppTextStyles.bodyExtraSmallInter.copyWith(
                    color: AppColors.white.withValues(alpha: 0.5),
                  ),
                )
              ],
            ),
        40.verticalBox,
      ],
    );
  }
}
