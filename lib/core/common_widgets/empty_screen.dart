import 'package:flutter/material.dart';

import '../assets/font_assets.dart';
import '../assets/image_assets.dart';
import '../assets/colors.dart';
import 'lw_custom_text.dart';

class EmptyScreen extends StatelessWidget {
  final String? imageString;
  final String? title;
  final String? subtitle;

  const EmptyScreen({Key? key, this.imageString, this.subtitle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageString ?? ImageAssets.noProducts,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 16),
          LWCustomText(
            title: title ?? "You Have No Products",
            fontSize: 17.0,
            color: AppColors.blackColor,
            fontFamily: FontAssets.avertaSemiBold,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 16),
          LWCustomText(
            title: subtitle ?? "Its Look Empty Start Add New Products",
            fontSize: 13.0,
            color: AppColors.blackColor,
            fontFamily: FontAssets.avertaRegular,
          ),
        ],
      ),
    );
  }
}
