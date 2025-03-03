import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleFavoriteWidget extends StatelessWidget {
  const SingleFavoriteWidget({super.key, this.fireBookModel});
  final FireBookModel? fireBookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          context.router.push(BookDetails(fireBookModel: fireBookModel));
        },
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
                          rating: fireBookModel?.rating ?? 0.0,
                          itemSize: 25,
                        ),
                        20.horizontalBox,
                        Text(
                          fireBookModel?.rating.toString() ?? '',
                          style: AppTextStyles.bodyMediumPoppins
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    8.verticalBox,
                    Text(
                      fireBookModel?.bookName ?? 'Harry Potters',
                      style: AppTextStyles.headlineMediumPoppins
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      'By ${fireBookModel?.authors}',
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
                  child: CachedNetworkImage(
                    imageUrl: fireBookModel?.bookImage ?? '',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
