import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_text_field.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _categories = [
    "All",
    "Fiction",
    "Non-Fiction",
    "Science",
    "History",
    "Romance",
    "Mystery",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultTabController(
          length: _categories.length,
          child: Column(
            children: [
              AppTextField.textField(
                context: context,
                prefixIcon: Icon(Icons.mic),
                suffixIcon: Icon(Icons.send_rounded),
                name: 'search',
                hint: 'What would you like to read?',
                backgroundColor: Colors.black26.withOpacity(0.2),
                borderRadius: 16,
              ),
              TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                  dividerColor: AppColors.transparent,
                  unselectedLabelColor: Colors.white60,
                  tabs: _categories
                      .map((category) => Tab(
                            text: category,
                          ))
                      .toList()),
              SizedBox(
                height: 800,
                child: TabBarView(
                  controller: _tabController,
                  children: _categories
                      .map((category) => Center(
                            child: Text(
                              category,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
