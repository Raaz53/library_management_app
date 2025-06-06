import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/features/add_book_screen/add_book_screen.dart';
import 'package:book_hive/features/book_lend_screen/book_lend_screen.dart';
import 'package:book_hive/features/book_list_screen/book_list_screen.dart';
import 'package:book_hive/features/book_request_screen/book_request_screen.dart';
import 'package:book_hive/features/dashboard_page/widgets/chat_popup_widget.dart';
import 'package:book_hive/features/dashboard_page/widgets/cutom_app_bar.dart';
import 'package:book_hive/features/favorite_screen/favorite_screen.dart';
import 'package:book_hive/features/home_screen/home_screen.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';
import 'package:book_hive/features/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: 'Dashboard')
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with AutoRouteAware {
  int _currentIndex = 0;
  late GetUserProfileCubit _getUserProfileCubit;
  ValueNotifier<String> globalUserRoleNotifier = ValueNotifier(globalUserRole);
  bool _chatOpen = false;

  @override
  void initState() {
    super.initState();
    _getUserProfileCubit = Injector.instance<GetUserProfileCubit>();
    _getUserProfileCubit.getUserProfile();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AutoRouteObserver().subscribe(this, context.routeData);
  }

  @override
  void dispose() {
    AutoRouteObserver().unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
      ),
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              _chatOpen = !_chatOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.chatColor,
            ),
            child: Icon(
              _chatOpen ? Icons.close : Icons.chat_bubble_outline,
              color: AppColors.buttonSecondary,
              size: 30,
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<String>(
            valueListenable: globalUserRoleNotifier,
            builder: (context, userRole, _) {
              final List<String> _tabTitles = [
                'Book Hive',
                'Book List',
                globalUserRole == UserRole.admin
                    ? 'Add New Book'
                    : 'Favorite Books',
                globalUserRole == UserRole.admin ? 'Book Request' : 'Book Lend',
                'Settings',
              ];

              return CustomAppBar(
                title: _tabTitles[_currentIndex],
              );
            },
          ),
        ),
        backgroundColor: AppColors.lightBlack,
        body: Stack(
          children: [
            IgnorePointer(
              ignoring: _chatOpen,
              child: BlocConsumer<GetUserProfileCubit, GetUserProfileState>(
                bloc: _getUserProfileCubit,
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      success: (userData) {
                        setState(() {});
                      });
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => SizedBox.shrink(),
                      loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      success: (userData) {
                        userName = userData?.name ?? '';
                        return IndexedStack(
                          index: _currentIndex,
                          children: [
                            HomeScreen(),
                            BookListScreen(),
                            globalUserRole == UserRole.admin
                                ? AddBookScreen()
                                : FavoriteScreen(
                                    favoriteBookId: userData?.favourites,
                                  ),
                            globalUserRole == UserRole.admin
                                ? BookRequestScreen()
                                : BookLendScreen(
                                    bookLendIds: userData?.borrowedBookList,
                                  ),
                            SettingScreen(
                              userModel: userData,
                            ),
                          ],
                        );
                      },
                      error: (message) => Center(
                            child: Text('Error fetching data'),
                          ));
                },
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              bottom: _chatOpen ? 80 : 20,
              right: _chatOpen ? 0 : -20,
              child: AnimatedScale(
                duration: Duration(milliseconds: 700),
                scale: _chatOpen ? 1 : 0,
                curve: Curves.fastOutSlowIn,
                alignment: Alignment(1.0, 1.0),
                child: ChatPopupWidget(),
              ),
            ),
          ],
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
              globalUserRole == UserRole.admin
                  ? SvgAssets.addSelected
                  : SvgAssets.favoriteSelected,
              globalUserRole == UserRole.admin
                  ? SvgAssets.addUnselected
                  : SvgAssets.favoriteUnselected,
            ),
            _buildNavBarItem(
              3,
              SvgAssets.librarySelected,
              SvgAssets.libraryUnselected,
            ),
            _buildNavBarItem(
              4,
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
