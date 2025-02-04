import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:book_hive/features/add_book_screen/widgets/add_book_image_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/category_selection_widget.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            AddBookImageWidget(
              imageData: ImageAssets.harryPotter,
            ),
            10.verticalBox,
            AppTextField.textField(
              context: context,
              style: TextStyle(color: Colors.white60),
              headerTitle: 'Title',
              headerStyle: TextStyle(color: Colors.white60),
              isTextFieldOnly: false,
              borderRadius: 10,
              name: 'bookName',
              hint: 'Book Title',
              backgroundColor: AppColors.black.withOpacity(0.3),
            ),
            10.verticalBox,
            AppTextField.textField(
              context: context,
              headerTitle: 'Description',
              style: TextStyle(color: Colors.white60),
              headerStyle: TextStyle(color: Colors.white60),
              isTextFieldOnly: false,
              maxLines: 4,
              borderRadius: 10,
              name: 'bookDescription',
              hint: 'Book Description',
              backgroundColor: AppColors.black.withOpacity(0.3),
            ),
            10.verticalBox,
            AppTextField.textField(
              context: context,
              headerTitle: 'Authors',
              style: TextStyle(color: Colors.white60),
              headerStyle: TextStyle(color: Colors.white60),
              isTextFieldOnly: false,
              borderRadius: 10,
              name: 'bookAuthors',
              hint: 'Author Name',
              backgroundColor: AppColors.black.withOpacity(0.3),
            ),
            10.verticalBox,
            AppTextField.textField(
              context: context,
              headerTitle: 'Published Date',
              style: TextStyle(color: Colors.white60),
              headerStyle: TextStyle(color: Colors.white60),
              isTextFieldOnly: false,
              borderRadius: 10,
              name: 'publishedDate',
              hint: '1999-08-11',
              backgroundColor: AppColors.black.withOpacity(0.3),
            ),
            10.verticalBox,
            Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
            CategoryCheckboxList(
              categories: [
                'Fiction',
                'Science',
                'History',
                'Technology',
                'Art',
                'Music',
                'Health',
                'Business',
                'Sports'
              ],
              onSelectionChanged: (selected) {
                print('Selected categories: $selected');
              },
            ),
          ],
        ),
      ),
    );
  }
}
