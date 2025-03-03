import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/features/book_lend_screen/cubit/get_book_lend_history_cubit/get_book_lend_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/single_book_lend_status.dart';

class BookLendScreen extends StatefulWidget {
  const BookLendScreen({super.key, this.bookLendIds});

  final List<String>? bookLendIds;

  @override
  State<BookLendScreen> createState() => _BookLendScreenState();
}

class _BookLendScreenState extends State<BookLendScreen> {
  late GetBookLendHistoryCubit _bookLendHistoryCubit;

  @override
  void initState() {
    super.initState();
    _bookLendHistoryCubit = Injector.instance<GetBookLendHistoryCubit>();

    _bookLendHistoryCubit.getBookLendHistory(widget.bookLendIds);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<GetBookLendHistoryCubit, GetBookLendHistoryState>(
        bloc: _bookLendHistoryCubit,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            success: (booksHistory) {
              return RefreshIndicator(
                onRefresh: () async => _bookLendHistoryCubit
                    .getBookLendHistory(widget.bookLendIds),
                child: ListView.builder(
                  itemCount: booksHistory?.length,
                  itemBuilder: (context, index) {
                    final singleBook = booksHistory?[index];
                    return SingleBookLendStatus(
                      bookId: singleBook?.bookId,
                      bookLendStatus: singleBook?.bookIssueStatus,
                    );
                  },
                ),
              );
            },
            error: (message) => Center(
              child: Text('Error fetching lend book data'),
            ),
          );
        },
      ),
    );
  }
}
