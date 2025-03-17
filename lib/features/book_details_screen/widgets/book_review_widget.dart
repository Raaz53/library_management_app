import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/saved_book_model/saved_book_model.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/features/book_details_screen/cubit/add_review_cubit/add_book_review_cubit.dart';
import 'package:book_hive/features/book_details_screen/cubit/edit_review_cubit/edit_review_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/resources/assets.dart';
import '../../../core/utilities/app_text_styles.dart';
import '../../../core/utilities/constants.dart';
import '../../../core/widgets/app_button_widget.dart';
import '../../../core/widgets/app_text_field.dart';

class BookReviewWidget extends StatefulWidget {
  const BookReviewWidget(
      {super.key, this.bookId, this.initialReview, this.userReview});
  final String? bookId;
  final ReviewModel? userReview;
  final String? initialReview;

  @override
  State<BookReviewWidget> createState() => _BookReviewWidgetState();
}

final _formKey = GlobalKey<FormBuilderState>();

class _BookReviewWidgetState extends State<BookReviewWidget> {
  late AddBookReviewCubit _addBookReviewCubit;
  late EditReviewCubit _editReviewCubit;
  late double rating;
  bool isDisabled = true;
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
    _addBookReviewCubit = Injector.instance<AddBookReviewCubit>();
    _editReviewCubit = Injector.instance<EditReviewCubit>();
    rating = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddBookReviewCubit, AddBookReviewState>(
      bloc: _addBookReviewCubit,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => context.router.maybePop(),
          error: (message) {
            context.router.maybePop();
            Utilities.showSnackBar(isError: true, context, message);
          },
          success: () {
            isDisabled = true;
            isEdited = false;
            context.router.maybePop();
            Utilities.showCustomDialog(
              context: context,
              child: Lottie.asset(
                LottieAssets.done,
                repeat: false,
                onLoaded: (composition) {
                  Future.delayed(
                    composition.duration,
                    () {
                      if (context.mounted) {
                        context.router.popUntil(
                            (route) => route.settings.name == 'BookDetails');
                      }
                    },
                  );
                },
              ),
            );
          },
          loading: () => Utilities.showCustomDialog(
            context: context,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      child: BlocListener<EditReviewCubit, EditReviewState>(
        bloc: _editReviewCubit,
        listener: (context, state) {
          state.maybeWhen(
              orElse: () => context.router.maybePop(),
              success: () {
                isDisabled = false;
                isEdited = true;
              });
        },
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (double value) {
                    rating = value;
                  }),
              10.verticalBox,
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      ImageAssets.profileImg,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  10.horizontalBox,
                  Text(
                    userName ?? 'Anonymous',
                    style: AppTextStyles.bodyMediumMonserat.copyWith(
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'feed_back',
                isDisabled: isDisabled,
                initialValue: widget.userReview?.reviewString,
                hint: 'Enter your feedback',
                style: AppTextStyles.bodySmallMonserat.copyWith(
                    color: AppColors.white
                        .withValues(alpha: isDisabled ? 0.3 : 0.8)),
                maxLines: 5,
                maxLength: 300,
                borderRadius: 10,
                backgroundColor: AppColors.lightGray.withValues(alpha: 0.05),
              ),
              widget.userReview?.reviewString != null && !isEdited
                  ? AppButton(
                      title: 'Edit',
                      backgroundColor: AppColors.primaryColor,
                      onClick: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          final userReview = ReviewModel(
                            studentId: FirebaseAuth.instance.currentUser?.uid,
                            studentName: userName,
                            reviewString:
                                _formKey.currentState!.value['feed_back'],
                            rating: rating,
                          );
                          _editReviewCubit.editUserReview(
                              userReview.reviewString,
                              widget.bookId,
                              widget.userReview?.reviewId);
                        }
                      })
                  : AppButton(
                      backgroundColor: AppColors.primaryColor,
                      onClick: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          final userReview = ReviewModel(
                            studentId: FirebaseAuth.instance.currentUser?.uid,
                            studentName: userName,
                            reviewString:
                                _formKey.currentState!.value['feed_back'],
                            rating: rating,
                          );
                          _addBookReviewCubit.addBookReview(
                              userReview, widget.bookId);
                        }
                      },
                      title: 'Submit',
                    ),
              10.verticalBox,
            ],
          ),
        ),
      ),
    );
  }
}
