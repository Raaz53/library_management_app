import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryResultTab extends StatefulWidget {
  const CategoryResultTab({super.key, required this.category, this.bookModels});
  final String category;
  final List<FireBookModel>? bookModels;

  @override
  State<CategoryResultTab> createState() => _CategoryResultTabState();
}

class _CategoryResultTabState extends State<CategoryResultTab> {
  late List<FireBookModel>? _filteredBooks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final books = widget.bookModels;
    if (widget.category == 'All') {
      _filteredBooks = books;
    } else {
      _filteredBooks = books
              ?.where(
                  (book) => book.categories?.contains(widget.category) ?? false)
              .toList() ??
          [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _filteredBooks?.length ?? 0,
      itemBuilder: (context, index) {
        final FireBookModel book = _filteredBooks![index];
        return GestureDetector(
          onTap: () {
            context.router.push(BookDetails(fireBookModel: book));
          },
          child: Container(
            height: 200,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                book.bookImage != null
                    ? CachedNetworkImage(
                        imageUrl: book.bookImage!,
                      )
                    : Image.asset(
                        ImageAssets.harryPotter,
                      ),
                8.horizontalBox,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.bookName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMediumMonserat
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    2.verticalBox,
                    Text(
                      book.bookDescription ?? '',
                      style: AppTextStyles.bodyExtraSmallMonserat,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
