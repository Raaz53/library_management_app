import 'package:flutter/material.dart';

class CategoryResultTab extends StatefulWidget {
  const CategoryResultTab({super.key});

  @override
  State<CategoryResultTab> createState() => _CategoryResultTabState();
}

class _CategoryResultTabState extends State<CategoryResultTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Text('data');
        });
  }
}
