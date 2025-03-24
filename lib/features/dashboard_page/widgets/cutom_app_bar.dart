import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/resources/assets.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/services/auth_services.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
  });
  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightBlack,
      title: Text(
        title ?? '',
        style: AppTextStyles.headlineLargeMonserat
            .copyWith(fontWeight: FontWeight.bold),
      ),
      leading: leading,
      centerTitle: true,
      actions: [
        PopupMenuButton(
          position: PopupMenuPosition.under,
          icon: ClipOval(
            child: Image.asset(
              ImageAssets.profileImg,
              height: 40,
              width: 40,
            ),
          ),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              onTap: () async {
                await AuthService.signOut();
                if (context.mounted) {
                  context.router.replaceAll([LogIn()]);
                }
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
