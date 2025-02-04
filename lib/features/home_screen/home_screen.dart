import 'package:auto_route/annotations.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:book_hive/features/home_screen/widgets/author_list_view.dart';
import 'package:book_hive/features/home_screen/widgets/new_book_grid_view.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
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
                  AppTextField.textField(
                    context: context,
                    prefixIcon: Icon(Icons.search),
                    name: 'search',
                    hint: 'What would you like to read?',
                    backgroundColor: Colors.black26.withOpacity(0.2),
                    borderRadius: 16,
                  ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures dynamic height
                children: [
                  NewBookGridView(), // This must have shrinkWrap: true inside
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
