import 'package:book_hive/features/book_lend/widgets/single_book_lend_status.dart';
import 'package:flutter/material.dart';

class BookRequestScreen extends StatefulWidget {
  const BookRequestScreen({super.key});

  @override
  State<BookRequestScreen> createState() => _BookRequestScreenState();
}

class _BookRequestScreenState extends State<BookRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return SingleBookLendStatus(
              isBookRequest: true,
            );
          }),
    );
  }
}
