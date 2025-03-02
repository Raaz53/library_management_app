import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late double rating;
  @override
  void initState() {
    super.initState();
    rating = 2.7;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
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
                    padding:
                        EdgeInsets.only(left: 140, top: 8, right: 8, bottom: 8),
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              rating: rating,
                              itemSize: 25,
                            ),
                            20.horizontalBox,
                            Text(
                              rating.toString(),
                              style: AppTextStyles.bodyMediumPoppins
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        8.verticalBox,
                        Text(
                          'Harry Potters',
                          style: AppTextStyles.headlineMediumPoppins.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          'By Writers Name',
                          style: AppTextStyles.bodySmallMonserat
                              .copyWith(color: Colors.amber),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
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
              ],
            ),
          );
        },
      ),
    );
  }
}
