import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/features/favorite_screen/cubit/get_user_favorite_cubit/get_user_favorite_cubit.dart';
import 'package:book_hive/features/setting_screen/cubit/get_user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/single_favorite_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, this.favoriteBookId});

  final List<String>? favoriteBookId;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late double rating;
  late GetUserFavoriteCubit _favoriteCubit;

  @override
  void initState() {
    super.initState();
    rating = 2.7;
    _favoriteCubit = Injector.instance<GetUserFavoriteCubit>();
    _favoriteCubit.getUserFavoriteBooks(widget.favoriteBookId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<GetUserFavoriteCubit, GetUserFavoriteState>(
        bloc: _favoriteCubit,
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => SizedBox.shrink(),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              success: (favoriteBooks) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await Injector.instance<GetUserProfileCubit>()
                        .getUserProfile();
                  },
                  child: ListView.builder(
                    itemCount: favoriteBooks?.length,
                    itemBuilder: (context, index) {
                      final singleFireBook = favoriteBooks?[index];
                      return SingleFavoriteWidget(
                        fireBookModel: singleFireBook,
                      );
                    },
                  ),
                );
              },
              error: (message) => Center(
                    child: Text(
                      'Error fetching data',
                      style: AppTextStyles.headlineLargeMonserat,
                    ),
                  ));
        },
      ),
    );
  }
}
