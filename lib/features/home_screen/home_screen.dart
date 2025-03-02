import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/features/home_screen/widgets/author_list_view.dart';
import 'package:book_hive/features/home_screen/widgets/new_book_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/get_firebase_books_cubit/get_firebase_books_cubit.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetFirebaseBooksCubit _getFirebaseBooksCubit;

  @override
  void initState() {
    super.initState();
    _getFirebaseBooksCubit = Injector.instance<GetFirebaseBooksCubit>();
    _getFirebaseBooksCubit.getFirebaseBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      log('here the user role is $globalUserRole');

      return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // AppTextField.textField(
                  //   context: context,
                  //   prefixIcon: Icon(Icons.search),
                  //   name: 'search',
                  //   hint: 'What would you like to read?',
                  //   backgroundColor: Colors.black26.withValues(alpha: 0.2),
                  //   borderRadius: 16,
                  // ),
                  20.verticalBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Authors',
                        style: TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white60,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: AuthorListView(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: BlocBuilder<GetFirebaseBooksCubit, GetFirebaseBooksState>(
                bloc: _getFirebaseBooksCubit,
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    loading: () => Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    success: (books) => Column(
                      mainAxisSize: MainAxisSize.min, // Ensures dynamic height
                      children: [
                        NewBookGridView(
                          books: books,
                        ),
                      ],
                    ),
                    error: (error) => Center(child: Text('Error: $error')),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }));
  }
}
