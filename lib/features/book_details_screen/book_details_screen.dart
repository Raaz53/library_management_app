import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/book_details_screen/cubit/borrow_book_cubit/borrow_book_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/get_book_reviews_cubit/get_book_reviews_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/get_book_status_details_cubit/get_book_status_details_cubit.dart';
import 'package:book_hive/features/book_details_screen/widgets/book_review_widget.dart';
import 'package:book_hive/features/book_details_screen/widgets/reviews_list_widget.dart';
import 'package:book_hive/features/dashboard_page/widgets/cutom_app_bar.dart';
import 'package:book_hive/features/favorite_screen/cubit/update_favorite_books/update_favorite_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'BookDetails')
class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, this.fireBookModel, this.lendedBooksLog});
  final FireBookModel? fireBookModel;
  final List<String>? lendedBooksLog;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late bool _isFavorite;
  late GetBookStatusDetailsCubit _getBookStatusDetailsCubit;
  late UpdateFavoriteBooksCubit _updateFavoriteBooksCubit;
  late GetBookReviewsCubit _getBookReviewsCubit;
  late BorrowBookCubit _borrowBookCubit;
  late bool _isAvailable;
  late bool _enableReview;
  String displayText = 'Borrow';

  @override
  void initState() {
    super.initState();
    _updateFavoriteBooksCubit = Injector.instance<UpdateFavoriteBooksCubit>();
    _getBookStatusDetailsCubit = Injector.instance<GetBookStatusDetailsCubit>();
    _getBookReviewsCubit = Injector.instance<GetBookReviewsCubit>();
    _borrowBookCubit = Injector.instance<BorrowBookCubit>();
    _getBookStatusDetailsCubit
        .getBookStatusDetails(widget.fireBookModel?.bookId);
    _getBookReviewsCubit.getBookReviews(widget.fireBookModel?.bookId);

    // Initialize favorite state correctly
    _isFavorite =
        userFavoriteBooks?.contains(widget.fireBookModel?.bookId) ?? false;
    _isAvailable = true;
    _enableReview = _reviewValidation(widget.fireBookModel?.lenders);
    log('here the review is shown $_enableReview');
  }

  bool _reviewValidation(List<String>? lenders) {
    log('the lenders are $lenders');
    if (lenders == null || lenders.isEmpty) return false;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (lenders.contains(uid)) {
      return true;
    }
    return false;
  }

  void _toggleFavorite() {
    final bookId = widget.fireBookModel?.bookId ?? '';

    if (bookId.isEmpty) return;

    _updateFavoriteBooksCubit.updateFavoriteBooks(bookId, !_isFavorite);
  }

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
      body: BlocConsumer<UpdateFavoriteBooksCubit, UpdateFavoriteBooksState>(
        bloc: _updateFavoriteBooksCubit,
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              setState(() {
                _isFavorite = !_isFavorite;

                // Ensure we modify a mutable list
                final mutableFavorites =
                    List<String>.from(userFavoriteBooks ?? []);

                if (_isFavorite) {
                  mutableFavorites.add(widget.fireBookModel!.bookId!);
                } else {
                  mutableFavorites.remove(widget.fireBookModel!.bookId!);
                }

                // Assign back to userFavoriteBooks
                userFavoriteBooks = mutableFavorites;
              });
            },
            error: (message) {
              log("Failed to update favorite: $message");
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(child: CircularProgressIndicator()),
            orElse: () => BlocBuilder<GetBookStatusDetailsCubit,
                GetBookStatusDetailsState>(
              bloc: _getBookStatusDetailsCubit,
              builder: (context, state) {
                final availableBook = state.maybeWhen(
                  orElse: () {
                    _isAvailable = false;
                    return null;
                  },
                  success: (bookStatusDetails) {
                    final BookStatusDetail? data =
                        bookStatusDetails?.firstWhere(
                      (book) {
                        if (book.bookStatus == LibraryBookStatus.available) {
                          _isAvailable = true;
                          return true;
                        } else {
                          _isAvailable = false;
                          return false;
                        }
                      },
                      orElse: () {
                        _isAvailable = false;
                        return BookStatusDetail();
                      },
                    );
                    return data?.bookNumber == null ? null : data;
                  },
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                    color: AppColors.black.withOpacity(0.7),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: widget.fireBookModel?.bookImage != null
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            widget.fireBookModel!.bookImage!,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Image.asset(
                                        ImageAssets.harryPotter,
                                        fit: BoxFit.fitHeight,
                                      ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: _toggleFavorite,
                                      child: Icon(
                                        Icons.favorite,
                                        color: _isFavorite
                                            ? AppColors.red
                                            : AppColors.buttonSecondary,
                                      ),
                                    ),
                                    5.horizontalBox,
                                    Text(
                                      'Favorite',
                                      style: AppTextStyles.bodyMediumMonserat
                                          .copyWith(
                                              fontWeight: FontWeight.w800),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.fireBookModel?.rating == null
                                              ? '0'
                                              : widget.fireBookModel?.rating
                                                      .toString() ??
                                                  '0',
                                          style: AppTextStyles
                                              .bodyMediumMonserat
                                              .copyWith(
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          'Rating',
                                          style: AppTextStyles
                                              .bodyExtraSmallInter
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.fireBookModel?.pageCount
                                                  .toString() ??
                                              '238',
                                          style: AppTextStyles
                                              .bodyMediumMonserat
                                              .copyWith(
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          'Pages',
                                          style: AppTextStyles
                                              .bodyExtraSmallInter
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
                              'No description available.',
                          style: AppTextStyles.bodyExtraSmallInter.copyWith(
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                        20.verticalBox,
                        if (globalUserRole == UserRole.user)
                          BlocListener<BorrowBookCubit, BorrowBookState>(
                            bloc: _borrowBookCubit,
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                success: () {
                                  displayText = StudentBookStatus.pending;
                                },
                              );
                            },
                            child:
                                BlocListener<BorrowBookCubit, BorrowBookState>(
                              bloc: _borrowBookCubit,
                              listener: (context, state) {
                                state.maybeWhen(
                                  orElse: () {},
                                  loading: () {
                                    Utilities.showCustomDialog(
                                      context: context,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                  success: () {
                                    _getBookStatusDetailsCubit
                                        .getBookStatusDetails(
                                            widget.fireBookModel?.bookId);
                                    context.router.maybePop();
                                  },
                                  error: (message) =>
                                      Utilities.showCustomDialog(
                                    context: context,
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () =>
                                              context.router.maybePop(),
                                          icon: Icon(Icons.close)),
                                    ),
                                  ),
                                );
                              },
                              child: AbsorbPointer(
                                absorbing: !_isAvailable,
                                child: AppButton(
                                  title: displayText,
                                  textColor: AppColors.black,
                                  onClick: () {
                                    BookLendedHistory bookLendHistory =
                                        BookLendedHistory(
                                      bookId: widget.fireBookModel?.bookId,
                                      bookNumber:
                                          availableBook?.bookNumber.toString(),
                                      bookIssueStatus:
                                          StudentBookStatus.pending,
                                    );
                                    _borrowBookCubit
                                        .requestBookBorrow(bookLendHistory);
                                  },
                                  backgroundColor: _isAvailable
                                      ? AppColors.buttonSecondary
                                      : AppColors.buttonSecondary
                                          .withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                          ),
                        20.verticalBox,
                        BlocBuilder<GetBookReviewsCubit, GetBookReviewsState>(
                          bloc: _getBookReviewsCubit,
                          builder: (context, reviewState) {
                            return reviewState.maybeWhen(
                              orElse: () => Container(),
                              error: (message) => Container(),
                              loading: () =>
                                  Center(child: CircularProgressIndicator()),
                              success: (reviews) {
                                if (reviews == null) return Container();
                                ReviewModel? userReview;
                                try {
                                  userReview = reviews.firstWhere(
                                    (review) =>
                                        review.studentId ==
                                        FirebaseAuth.instance.currentUser?.uid,
                                  );
                                } catch (e) {
                                  userReview = null;
                                }
                                final filteredReviews = reviews
                                    .where((review) =>
                                        review.studentId !=
                                        FirebaseAuth.instance.currentUser?.uid)
                                    .toList();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (_enableReview)
                                      BookReviewWidget(
                                        bookId: widget.fireBookModel?.bookId,
                                        initialReview: userReview?.reviewString,
                                        userReview: userReview,
                                      ),
                                    ReviewsListWidget(
                                      reviews: filteredReviews,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
