import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/features/book_lend_screen/cubit/return_book_cubit/return_book_cubit.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/models/book_return_model/book_return_model.dart';
import '../../../core/utilities/app_text_styles.dart';
import '../../../core/widgets/app_button_widget.dart';

class DialogReturnBookWidget extends StatefulWidget {
  const DialogReturnBookWidget({super.key, this.bookReturnModel});

  final BookReturnModel? bookReturnModel;

  @override
  State<DialogReturnBookWidget> createState() => _DialogReturnBookWidgetState();
}

class _DialogReturnBookWidgetState extends State<DialogReturnBookWidget> {
  late ReturnBookCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = Injector.instance<ReturnBookCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnBookCubit, ReturnBookState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {}, returned: () => context.router.maybePop());
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Return Book!',
                        style: AppTextStyles.headlineLargePoppins.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.grey.withValues(alpha: 0.8),
                        ),
                      ),
                      CloseButton(
                        color: AppColors.grey.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                  10.verticalBox,
                  Text(
                    'Are you sure?',
                    style: AppTextStyles.bodyMediumMonserat.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.grey.withValues(alpha: 0.8),
                    ),
                  ),
                  8.verticalBox,
                  AppButton(
                    title: 'Confirm',
                    onClick: () {
                      final bookReturnModel = widget.bookReturnModel
                          ?.copyWith(returnedDate: DateTime.now().toString());
                      _cubit.returnBook(bookReturnModel);
                      //call user get cubit
                      context.read<GetUserProfileCubit>().getUserProfile();
                      context.router.maybePop();
                    },
                    backgroundColor: AppColors.red.withValues(alpha: 0.5),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
