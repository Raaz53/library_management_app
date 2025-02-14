import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class DetailInfoWidget extends StatelessWidget {
  const DetailInfoWidget({super.key, this.email, this.bio});
  final String? email;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.black,
      ),
      child: Column(
        children: [
          Text(
            email ?? 'user1@gmail.com',
            style: AppTextStyles.bodyExtraSmallInter
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text('25 years old',
              style: AppTextStyles.bodyExtraSmallInter.copyWith(fontSize: 10)),
          SizedBox(height: 8.0),
          Text(
            bio ??
                'About me. I am a book lover. I enjoy reading books and writing stories. I also love to travel and explore new places. I am a book lover. I enjoy reading books and writing stories. I also love to travel and explore new places.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyExtraSmallInter.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
