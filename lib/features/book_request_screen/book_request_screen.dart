import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/features/book_lend_screen/widgets/single_book_lend_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/get_book_lend_pending_cubit/get_book_lend_pending_cubit.dart';

class BookRequestScreen extends StatefulWidget {
  const BookRequestScreen({super.key});

  @override
  State<BookRequestScreen> createState() => _BookRequestScreenState();
}

class _BookRequestScreenState extends State<BookRequestScreen> {
  late GetBookLendPendingCubit _bookLendPendingCubit;

  @override
  void initState() {
    super.initState();
    _bookLendPendingCubit = Injector.instance<GetBookLendPendingCubit>();
    _bookLendPendingCubit.getPendingBookLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<GetBookLendPendingCubit, GetBookLendPendingState>(
        bloc: _bookLendPendingCubit,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Text('Error creating cubit $message'),
            ),
            success: (bookLend) {
              return ListView.builder(
                itemCount: bookLend?.length,
                cacheExtent: 9999999,
                itemBuilder: (context, index) {
                  final singleBookLend = bookLend?[index];
                  if (singleBookLend?.bookId == null) return SizedBox.shrink();

                  return SingleBookLendStatus(
                    isBookRequest: true,
                    singleBookLend: singleBookLend,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
