import 'dart:developer';

import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/features/home_screen/cubit/get_firebase_books_cubit/get_firebase_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/widgets/app_text_field.dart';
import 'widgets/category_result_tab.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late GetFirebaseBooksCubit _getFirebaseBooksCubit;
  late TextEditingController _searchController;
  final SpeechToText _speechToText = SpeechToText();

  final List<String> _categories = ['All'];
  bool _speechEnabled = false;
  String? _wordSpoken = null;

  @override
  void initState() {
    super.initState();

    _getFirebaseBooksCubit = Injector.instance<GetFirebaseBooksCubit>();
    _getFirebaseBooksCubit.getFirebaseBooks();
    _categories.addAll(Constants.bookCategories);
    _searchController = TextEditingController();
    _tabController = TabController(length: _categories.length, vsync: this);
    initSpeechToText();
  }

  void initSpeechToText() async {
    _speechEnabled = await _speechToText.initialize();
    log('Speech to text initialized: $_speechEnabled');
    setState(() {});
  }

  void _stopListening() async {
    log('stopped listening');
    await _speechToText.stop();
  }

  void _startListening() async {
    log('started listening');
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(result) {
    if (result.finalResult) {
      _searchController.text = result.recognizedWords;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _speechToText.stop();
    _getFirebaseBooksCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DefaultTabController(
        length: _categories.length,
        child: Column(
          children: [
            AppTextField.textField(
              textEditingController: _searchController,
              context: context,
              prefixIcon: GestureDetector(
                onTap: _speechToText.isListening
                    ? _stopListening
                    : _startListening,
                child: Icon(
                    _speechToText.isNotListening ? Icons.mic : Icons.mic_off),
              ),
              suffixIcon: Icon(Icons.send_rounded),
              name: 'search',
              style: AppTextStyles.bodyMediumMonserat,
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
            Expanded(
              child: BlocBuilder<GetFirebaseBooksCubit, GetFirebaseBooksState>(
                bloc: _getFirebaseBooksCubit,
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => SizedBox.shrink(),
                    success: (books) {
                      return TabBarView(
                        controller: _tabController,
                        children: _categories
                            .map(
                              (category) => RefreshIndicator(
                                onRefresh: () async =>
                                    _getFirebaseBooksCubit.getFirebaseBooks(),
                                child: CategoryResultTab(
                                  category: category,
                                  bookModels: books,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
