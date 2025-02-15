import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/google_book_model/google_book_model.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:book_hive/features/add_book_screen/widgets/add_book_image_widget.dart';
import 'package:book_hive/features/home_screen/cubit/get_books_cubit/get_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'widgets/category_selection_widget.dart';

final _formKey = GlobalKey<FormBuilderState>();

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  late GetBooksCubit _getBooksCubit;

  bool _isSearching = false;
  late String _searchQuery;
  late List<String> _selectedCategories;
  late String? _imageData;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _getBooksCubit = Injector.instance<GetBooksCubit>();
    _searchQuery = '';
    _getBooksCubit.getBooks(_searchQuery);
    _selectedCategories = [];
    _imageData = null;
    _quantity = 1;
  }

  _addQuantity() async {
    setState(() {
      _quantity++;
    });
  }

  _subQantity() async {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              AddBookImageWidget(
                imageData: _imageData,
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                style: TextStyle(color: Colors.white60),
                headerTitle: 'Title',
                isTextFieldOnly: false,
                onTextChanged: (value) {
                  if (value!.isNotEmpty) {
                    setState(() {
                      _isSearching = true;
                    });
                    _searchQuery = value;
                    _getBooksCubit.getBooks(_searchQuery);
                  } else {
                    setState(() {
                      _isSearching = false;
                    });
                  }
                },
                borderRadius: 10,
                name: 'book_name',
                hint: 'Book Title',
                backgroundColor: AppColors.black.withValues(alpha: 0.3),
              ),
              Visibility(
                visible: _isSearching,
                child: Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<GetBooksCubit, GetBooksState>(
                    bloc: _getBooksCubit,
                    builder: (context, state) {
                      return state.maybeWhen(
                        multipleBooks: (books) {
                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.white24,
                            ),
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              BookItem book = books[index];
                              return ListTile(
                                leading: SizedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: book.volumeInfo?.imageLinks
                                            ?.thumbnail ??
                                        '',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                title: Text(
                                  book.volumeInfo?.title ?? '',
                                  style: AppTextStyles.bodySmallMonserat
                                      .copyWith(color: Colors.white60),
                                ),
                                subtitle: Text(
                                  book.volumeInfo?.authors?.join(', ') ?? '',
                                  style: AppTextStyles.bodyExtraSmallInter
                                      .copyWith(color: Colors.white38),
                                ),
                                onTap: () {
                                  _formKey.currentState?.patchValue(
                                    {
                                      'book_name': book.volumeInfo?.title ?? '',
                                      'book_description':
                                          book.volumeInfo?.description ?? '',
                                      'book_authors': book.volumeInfo?.authors
                                              ?.join(', ') ??
                                          '',
                                      'published_date':
                                          book.volumeInfo?.publishedDate ?? '',
                                    },
                                  );
                                  setState(() {
                                    _imageData =
                                        book.volumeInfo?.imageLinks?.thumbnail;
                                    _isSearching = false;
                                  });
                                },
                              );
                            },
                          );
                        },
                        orElse: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                headerTitle: 'Description',
                style: TextStyle(color: Colors.white60),
                isTextFieldOnly: false,
                maxLines: 4,
                borderRadius: 10,
                name: 'book_description',
                hint: 'Book Description',
                backgroundColor: AppColors.black.withOpacity(0.3),
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                headerTitle: 'Authors',
                style: TextStyle(color: Colors.white60),
                isTextFieldOnly: false,
                borderRadius: 10,
                name: 'book_authors',
                hint: 'Author Name',
                backgroundColor: AppColors.black.withOpacity(0.3),
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                headerTitle: 'Published Date',
                style: TextStyle(color: Colors.white60),
                isTextFieldOnly: false,
                borderRadius: 10,
                name: 'published_date',
                hint: '1999-08-11',
                backgroundColor: AppColors.black.withOpacity(0.3),
              ),
              10.verticalBox,
              Row(
                children: [
                  Text(
                    'Categories',
                    style: AppTextStyles.bodySmallMonserat,
                  ),
                ],
              ),
              10.verticalBox,
              CategoryCheckboxList(
                categories: Constants.bookCategories,
                onSelectionChanged: (selected) {
                  _selectedCategories = selected;
                },
              ),
              10.verticalBox,
              Row(
                children: [
                  Text(
                    'Quantities',
                    style: AppTextStyles.bodySmallMonserat,
                  ),
                ],
              ),
              10.verticalBox,
              Row(
                children: [
                  IconButton(
                      onPressed: _addQuantity,
                      splashColor: AppColors.transparent,
                      icon: Icon(Icons.add_circle_outline_outlined)),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _quantity.toString(),
                      style: AppTextStyles.bodySmallInter,
                    ),
                  ),
                  IconButton(
                      onPressed: _subQantity,
                      splashColor: AppColors.transparent,
                      icon: Icon(Icons.remove_circle_outline_outlined)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
