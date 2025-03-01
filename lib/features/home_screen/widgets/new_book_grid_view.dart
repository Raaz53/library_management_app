import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/assets.dart';

class NewBookGridView extends StatelessWidget {
  const NewBookGridView({super.key, this.books});
  final List<FireBookModel>? books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New in collection',
            style: AppTextStyles.headlineSmallMonserat
                .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
          10.verticalBox,
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: books?.length ?? 6,
              itemBuilder: (context, index) {
                final FireBookModel book = books![index];
                return GestureDetector(
                  onTap: () {
                    context.router.push(BookDetails(fireBookModel: book));
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          // spreadRadius: 0.000001,
                          blurRadius: 5,
                          offset: Offset(2, 3),
                        ),
                      ],
                    ),
                    child: book.bookImage != null
                        ? CachedNetworkImage(
                            imageUrl: book.bookImage!,
                            fit: BoxFit.fitHeight,
                          )
                        : Image.asset(
                            ImageAssets.harryPotter,
                            fit: BoxFit.fitHeight,
                          ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
