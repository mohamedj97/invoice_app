import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class PricingItem extends StatelessWidget {
  final String title;
  final Color? iconColor;
  final Color? textColor;

  const PricingItem({Key? key, required this.title, this.iconColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: iconColor ?? AppColors.primary,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: LWCustomText(
                title: title,
                color: textColor??AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: FontAssets.avertaSemiBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
