import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/assets.dart';

class NewBookGridView extends StatelessWidget {
  const NewBookGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New in collection'),
          10.verticalBox,
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        // spreadRadius: 0.000001,
                        blurRadius: 5,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    ImageAssets.harryPotter,
                    fit: BoxFit.fitHeight,
                  ),
                );
              })
        ],
      ),
    );
  }
}
