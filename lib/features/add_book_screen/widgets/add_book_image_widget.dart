import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
          ? Image.asset(widget.imageData!)
          : Stack(
              alignment: Alignment.center,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(8),
                  dashPattern: [4, 4],
                  strokeWidth: 1,
                  color: Colors.white24,
                  child: Container(
                    width: 146,
                    height: 210,
                    color: AppColors.transparent,
                  ),
                ),
                Icon(
                  Icons.add_circle,
                  size: 50,
                  color: Colors.white24,
                ),
              ],
            ),
    );
  }
}
