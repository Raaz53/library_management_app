import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/features/book_request_screen/cubit/get_user_by_id_cubit/get_user_by_id_cubit.dart';
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
  });
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
  late bool _isSuccess;

  @override
  void initState() {
    super.initState();
    _getUserByIdCubit = Injector.instance<GetUserByIdCubit>();
    log('here the uid is ${widget.userId} ');
    _getUserByIdCubit.getUserById(widget.userId);
    _isSuccess = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserByIdCubit, GetUserByIdState>(
      bloc: _getUserByIdCubit,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            success: (user) {
              return Container(
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
                                    setState(() {
                                      _isSuccess = true;
                                    });
                                  },
                                ),
                              ),
                              5.horizontalBox,
                              Expanded(
                                child: AppButton(
                                  title: 'Decline',
                                  backgroundColor:
                                      AppColors.red.withValues(alpha: 0.5),
                                  onClick: () {},
                                ),
                              ),
                            ],
                          )
                  ],
                ),
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
