import 'package:auto_route/annotations.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/features/add_book_screen/add_book_screen.dart';
import 'package:book_hive/features/book_list_screen/book_list_screen.dart';
import 'package:book_hive/features/dashboard_page/widgets/cutom_app_bar.dart';
import 'package:book_hive/features/home_screen/home_screen.dart';
import 'package:book_hive/features/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: 'Dashboard')
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BookListScreen(),
    AddBookScreen(),
    SettingScreen(),
  ];

  final List<String> _tabTitles = [
    'Book Hive',
    'Book List',
    'Add New Book',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: _tabTitles[_currentIndex],
        ),
        backgroundColor: AppColors.lightBlack,
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          elevation: 5,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: [
            _buildNavBarItem(
              0,
              SvgAssets.homeSelected,
              SvgAssets.homeUnselected,
            ),
            _buildNavBarItem(
              1,
              SvgAssets.booksSelected,
              SvgAssets.booksUnselected,
            ),
            _buildNavBarItem(
              2,
              SvgAssets.addSelected,
              SvgAssets.addUnselected,
            ),
            _buildNavBarItem(
              3,
              SvgAssets.profileSelected,
              SvgAssets.profileUnselected,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      int index, String selectedIcon, String unselectedIcon) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        _currentIndex == index ? selectedIcon : unselectedIcon,
        width: 24,
        height: 24,
      ),
      label: "",
    );
  }
}
