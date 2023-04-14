import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class PricingItem extends StatelessWidget {
  final String title;

  const PricingItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
          ),
          LWCustomText(
            title: title,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontFamily: FontAssets.avertaSemiBold,
          )
        ],
      ),
    );
  }
}
