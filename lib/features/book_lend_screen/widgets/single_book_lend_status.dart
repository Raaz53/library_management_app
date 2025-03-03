import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_single_book_cubit/get_single_book_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleBookLendStatus extends StatefulWidget {
  const SingleBookLendStatus(
      {super.key,
      this.isBookRequest = false,
      this.bookLendStatus,
      this.bookId});
  final bool isBookRequest;
  final String? bookId;
  final String? bookLendStatus;

  @override
  State<SingleBookLendStatus> createState() => _SingleBookLendStatusState();
}

class _SingleBookLendStatusState extends State<SingleBookLendStatus> {
  late GetSingleBookCubit _getSingleBookCubit;
  @override
  void initState() {
    super.initState();
    _getSingleBookCubit = Injector.instance<GetSingleBookCubit>();
    _getSingleBookCubit.getSingleBook(widget.bookId);
  }

  String _bookStatus(String? bookStatus) {
    if (bookStatus == StudentBookStatus.pending) {
      return 'Pending';
    } else if (bookStatus == StudentBookStatus.returned) {
      return 'Returned';
    } else if (bookStatus == StudentBookStatus.borrowed) {
      return 'Borrowed';
    } else {
      return 'Over Due';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleBookCubit, GetSingleBookState>(
      bloc: _getSingleBookCubit,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => SizedBox.shrink(),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          success: (book) {
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
                      padding: EdgeInsets.only(
                          left: 140, top: 8, right: 8, bottom: 8),
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
                            book?.bookName ?? 'Harry Potters',
                            style: AppTextStyles.headlineMediumPoppins.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            'By ${book?.authors ?? 'Writers Name'}',
                            style: AppTextStyles.bodySmallMonserat
                                .copyWith(color: Colors.amber),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            'Published at: ${book?.publishedDate ?? ''}',
                            style: AppTextStyles.bodyExtraSmallInter,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!widget.isBookRequest)
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.red, width: 2),
                        ),
                        child: Text(
                          _bookStatus(widget.bookLendStatus),
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
                        child: book?.bookImage != null
                            ? CachedNetworkImage(
                                imageUrl: book?.bookImage ?? '',
                                fit: BoxFit.fitHeight,
                              )
                            : Image.asset(
                                ImageAssets.harryPotter,
                                fit: BoxFit.fitHeight,
                              ),
                      ),
                    ),
                  ),
                  if (widget.isBookRequest)
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Row(
                        children: [
                          AppButton(
                            title: 'Approve',
                            onClick: () {},
                            backgroundColor:
                                Colors.green.withValues(alpha: 0.5),
                            width: 50,
                          ),
                          10.horizontalBox,
                          AppButton(
                            title: 'Decline',
                            onClick: () {},
                            backgroundColor:
                                AppColors.red.withValues(alpha: 0.5),
                            width: 50,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            );
          },
          error: (message) => Center(
            child: Text(
              'Error fetching book',
              style: AppTextStyles.bodyLargeMonserat,
            ),
          ),
        );
      },
    );
  }
}
