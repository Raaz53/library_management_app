import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/book_lend_approval_model/book_lend_approval_model.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/book_request_screen/cubit/book_lend_approval_cubit/book_lend_approval_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_book_lend_pending_cubit/get_book_lend_pending_cubit.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_user_by_id_cubit/get_user_by_id_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogApprovalWidget extends StatefulWidget {
  const DialogApprovalWidget({
    super.key,
    this.bookName,
    this.bookAuthors,
    this.bookNumber,
    this.userId,
    this.lendId,
    this.bookId,
  });

  final String? bookId;
  final String? lendId;
  final String? bookName;
  final String? bookAuthors;
  final String? bookNumber;
  final String? userId;

  @override
  State<DialogApprovalWidget> createState() => _DialogApprovalWidgetState();
}

class _DialogApprovalWidgetState extends State<DialogApprovalWidget> {
  late GetUserByIdCubit _getUserByIdCubit;
  late BookLendApprovalCubit _bookLendApprovalCubit;
  late bool _isSuccess;
  final currentUser = FirebaseAuth.instance.currentUser;
  late String? uid;

  @override
  void initState() {
    super.initState();
    _getUserByIdCubit = Injector.instance<GetUserByIdCubit>();
    _bookLendApprovalCubit = Injector.instance<BookLendApprovalCubit>();
    _getUserByIdCubit.getUserById(widget.userId);
    _isSuccess = false;
    uid = currentUser?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdCubit, GetUserByIdState>(
      bloc: _getUserByIdCubit,
      builder: (context, userState) {
        return userState.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            success: (user) {
              return BlocConsumer<BookLendApprovalCubit, BookLendApprovalState>(
                bloc: _bookLendApprovalCubit,
                listener: (context, lendState) {
                  lendState.maybeWhen(
                    orElse: () {},
                  );
                },
                builder: (context, lendState) {
                  return lendState.maybeWhen(
                    orElse: () => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Approval',
                            style: AppTextStyles.headlineLargePoppins.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.grey.withValues(alpha: 0.8),
                            ),
                          ),
                          10.verticalBox,
                          _titleSubWidget('Book Name:', widget.bookName),
                          _titleSubWidget('Book Authors:', widget.bookAuthors),
                          _titleSubWidget('Book Number:', widget.bookNumber),
                          _titleSubWidget('Requested By:', user?.name),
                          _titleSubWidget('Requester Id:', user?.id),
                          20.verticalBox,
                          _isSuccess
                              ? AppButton(
                                  title: 'Done',
                                  onClick: () {
                                    context.router.maybePop();
                                  },
                                  backgroundColor:
                                      AppColors.green.withValues(alpha: 0.5),
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: AppButton(
                                        title: 'Approve',
                                        onClick: () {
                                          final DateTime bookIssueDate =
                                              DateTime.now();
                                          final DateTime bookDueDate =
                                              bookIssueDate.add(
                                                  const Duration(days: 30));

                                          log('here the current user is $uid');

                                          final bookLendApprovalModel =
                                              BookLendApprovalModel(
                                            lendId: widget.lendId,
                                            lenderId: uid,
                                            bookStatus:
                                                StudentBookStatus.borrowed,
                                            bookId: widget.bookId,
                                            bookNumber: widget.bookNumber,
                                            bookIssuedDate:
                                                bookIssueDate.toIso8601String(),
                                            bookDueDate:
                                                bookDueDate.toIso8601String(),
                                          );

                                          _bookLendApprovalCubit.acceptBookLend(
                                              bookLendApprovalModel);
                                        },
                                      ),
                                    ),
                                    5.horizontalBox,
                                    Expanded(
                                      child: AppButton(
                                        title: 'Decline',
                                        backgroundColor: AppColors.red
                                            .withValues(alpha: 0.5),
                                        onClick: () {
                                          final bookLendApprovalModel =
                                              BookLendApprovalModel(
                                            lendId: widget.lendId,
                                            lenderId: uid,
                                            bookId: widget.bookId,
                                            bookNumber: widget.bookNumber,
                                            bookStatus:
                                                StudentBookStatus.declined,
                                          );

                                          _bookLendApprovalCubit
                                              .declineBookLend(
                                                  bookLendApprovalModel);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (message) => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Error',
                            style: AppTextStyles.headlineLargePoppins.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.grey.withValues(alpha: 0.8),
                            ),
                          ),
                          10.verticalBox,
                          _titleSubWidget('Book Name:', widget.bookName),
                          _titleSubWidget('Book Authors:', widget.bookAuthors),
                          _titleSubWidget('Book Number:', widget.bookNumber),
                          _titleSubWidget('Granted To:', user?.name),
                          _titleSubWidget('Requester Id:', user?.id),
                          20.verticalBox,
                          AppButton(
                            title: 'Done',
                            titleStyle: TextStyle(color: AppColors.black),
                            onClick: () {
                              Injector.instance<GetBookLendPendingCubit>()
                                  .getPendingBookLogs();
                              context.router.maybePop();
                            },
                            backgroundColor:
                                AppColors.lightGray.withValues(alpha: 0.5),
                          )
                        ],
                      ),
                    ),
                    accept: () => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Approved',
                            style: AppTextStyles.headlineLargePoppins.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.grey.withValues(alpha: 0.8),
                            ),
                          ),
                          10.verticalBox,
                          _titleSubWidget('Book Name:', widget.bookName),
                          _titleSubWidget('Book Authors:', widget.bookAuthors),
                          _titleSubWidget('Book Number:', widget.bookNumber),
                          _titleSubWidget('Granted To:', user?.name),
                          _titleSubWidget('Requester Id:', user?.id),
                          20.verticalBox,
                          AppButton(
                            title: 'Done',
                            onClick: () {
                              context.router.maybePop();
                            },
                            backgroundColor:
                                AppColors.green.withValues(alpha: 0.5),
                          )
                        ],
                      ),
                    ),
                    decline: () => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Declined',
                            style: AppTextStyles.headlineLargePoppins.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.grey.withValues(alpha: 0.8),
                            ),
                          ),
                          10.verticalBox,
                          _titleSubWidget('Book Name:', widget.bookName),
                          _titleSubWidget('Book Authors:', widget.bookAuthors),
                          _titleSubWidget('Book Number:', widget.bookNumber),
                          _titleSubWidget('Declined To:', user?.name),
                          _titleSubWidget('Requester Id:', user?.id),
                          20.verticalBox,
                          AppButton(
                            title: 'Done',
                            onClick: () {
                              Injector.instance<GetBookLendPendingCubit>()
                                  .getPendingBookLogs();
                              context.router.maybePop();
                            },
                            backgroundColor:
                                AppColors.red.withValues(alpha: 0.5),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (message) => Center(
                  child: Text('Error thrown: $message'),
                ));
      },
    );
  }

  Widget _titleSubWidget(String? title, String? subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title ?? '',
            style: AppTextStyles.headlineSmallMonserat.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.grey.withValues(alpha: 0.35),
            ),
          ),
        ),
        Expanded(
          child: Text(
            subTitle ?? '',
            style: AppTextStyles.headlineSmallPoppins
                .copyWith(color: AppColors.white.withValues(alpha: 0.6)),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
