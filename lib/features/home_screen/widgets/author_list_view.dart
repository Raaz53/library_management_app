import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

class AuthorListView extends StatelessWidget {
  const AuthorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        itemCount: 9,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    ImageAssets.stephanKing,
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                ),
                10.verticalBox,
                Text(
                  'Stephan King',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis, color: Colors.white60),
                  maxLines: 2,
                ),
              ],
            ),
          ).pOnly(
            right: 28,
          );
        });
  }
}
