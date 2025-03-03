import 'package:book_hive/features/book_lend/widgets/single_book_lend_status.dart';
import 'package:flutter/material.dart';

class BookLendScreen extends StatefulWidget {
  const BookLendScreen({super.key});

  @override
  State<BookLendScreen> createState() => _BookLendScreenState();
}

class _BookLendScreenState extends State<BookLendScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return SingleBookLendStatus();
          }),
    );
  }
}
