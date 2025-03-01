import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/dashboard_page/widgets/cutom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'BookDetails')
class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, this.fireBookModel});
  final FireBookModel? fireBookModel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: CustomAppBar(
        title: 'Book Details',
        leading: SizedBox(
          height: 50,
          width: 50,
          child: BackButton(
            color: AppColors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.verticalBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.7),
                            spreadRadius: 2,
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: widget.fireBookModel?.bookImage != null
                          ? CachedNetworkImage(
                              imageUrl: widget.fireBookModel!.bookImage ?? '',
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset(ImageAssets.harryPotter,
                              fit: BoxFit.fitHeight),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.buttonSecondary,
                          ),
                          5.horizontalBox,
                          Text(
                            'Favorite',
                            style: AppTextStyles.bodyMediumMonserat
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      30.verticalBox,
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.buttonSecondary,
                          ),
                          5.horizontalBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.fireBookModel?.rating == null
                                    ? '0'
                                    : widget.fireBookModel?.rating.toString() ??
                                        '0',
                                style: AppTextStyles.bodyMediumMonserat
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'Rating',
                                style: AppTextStyles.bodyExtraSmallInter
                                    .copyWith(
                                        color: AppColors.white
                                            .withValues(alpha: 0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      30.verticalBox,
                      Row(
                        children: [
                          Icon(
                            Icons.import_contacts,
                            color: AppColors.buttonSecondary,
                          ),
                          5.horizontalBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '238',
                                style: AppTextStyles.bodyMediumMonserat
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'Pages',
                                style: AppTextStyles.bodyExtraSmallInter
                                    .copyWith(
                                        color: AppColors.white
                                            .withValues(alpha: 0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalBox,
              Text(
                'By ${widget.fireBookModel?.authors ?? 'John Doe'}',
                style: AppTextStyles.bodyMediumMonserat,
              ),
              10.verticalBox,
              Text(
                widget.fireBookModel?.bookName ??
                    'Harry Potter and the Philosopher\'s Stone',
                style: AppTextStyles.headlineMediumMonserat.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.verticalBox,
              Text(
                widget.fireBookModel?.bookDescription ??
                    'Description: All about the first book in the Harry Potter series. Lorem epsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: AppTextStyles.bodyExtraSmallInter.copyWith(
                  color: AppColors.white.withValues(alpha: 0.5),
                ),
              ),
              20.verticalBox,
              Wrap(
                spacing: 5,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(
                  widget.fireBookModel?.categories?.length ?? 0,
                  (index) => Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.disableGray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        '#${widget.fireBookModel?.categories?[index] ?? ''}'),
                  ),
                ),
              ),
              20.verticalBox,
              AppButton(
                title: 'Borrow',
                textColor: AppColors.black,
                onClick: () {},
                backgroundColor: AppColors.buttonSecondary,
              ),
              20.verticalBox
            ],
          ),
        ),
      ),
    );
  }
}
