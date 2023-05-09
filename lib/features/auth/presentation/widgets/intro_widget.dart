import 'package:flutter/material.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class IntroWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subTitle;

  const IntroWidget({Key? key, required this.imageAsset, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageAsset,width: double.infinity,fit: BoxFit.fitWidth),
        const SizedBox(height: 32.0),
        LWCustomText(
          title: title,
          color: AppColors.blackColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          fontFamily: FontAssets.avertaSemiBold,
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LWCustomText(
            title: subTitle,
            textAlign: TextAlign.center,
            color: AppColors.blackColor,
            fontSize: 15.0,
            fontFamily: FontAssets.avertaSemiBold,
          ),
        ),
      ],
    );
  }
}
