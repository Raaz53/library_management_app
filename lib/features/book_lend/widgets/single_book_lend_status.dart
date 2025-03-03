import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';

class SingleBookLendStatus extends StatelessWidget {
  const SingleBookLendStatus({super.key, this.isBookRequest = false});
  final bool isBookRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 170,
              padding: EdgeInsets.only(left: 140, top: 8, right: 8, bottom: 8),
              width: MediaQuery.sizeOf(context).width * 0.95,
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.verticalBox,
                  Text(
                    'Harry Potters',
                    style: AppTextStyles.headlineMediumPoppins
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'By Writers Name',
                    style: AppTextStyles.bodySmallMonserat
                        .copyWith(color: Colors.amber),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'Published at: 1997',
                    style: AppTextStyles.bodyExtraSmallInter,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          if (!isBookRequest)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 2),
                ),
                child: Text(
                  'Borrowed',
                  style: AppTextStyles.bodyExtraSmallPoppins,
                ),
              ),
            ),
          Positioned(
            left: 0,
            child: SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImageAssets.harryPotter,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          if (isBookRequest)
            Positioned(
              right: 10,
              bottom: 10,
              child: Row(
                children: [
                  AppButton(
                    title: 'Approve',
                    onClick: () {},
                    backgroundColor: Colors.green.withValues(alpha: 0.5),
                    width: 50,
                  ),
                  10.horizontalBox,
                  AppButton(
                    title: 'Decline',
                    onClick: () {},
                    backgroundColor: AppColors.red.withValues(alpha: 0.5),
                    width: 50,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
