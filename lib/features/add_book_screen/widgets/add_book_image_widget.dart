import 'package:book_hive/core/resources/assets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/app_theme/app_colors.dart';

class AddBookImageWidget extends StatefulWidget {
  const AddBookImageWidget({super.key, this.imageData});
  final String? imageData;

  @override
  State<AddBookImageWidget> createState() => _AddBookImageWidgetState();
}

class _AddBookImageWidgetState extends State<AddBookImageWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 146,
      height: 210,
      child: widget.imageData != null
          ? CachedNetworkImage(
              imageUrl: widget.imageData!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: AppColors.white,
              ),
            )
          : Image.asset(
              ImageAssets.harryPotter,
              fit: BoxFit.cover,
            ),
    );
  }
}
