import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onPressed;
  const CustomElevatedButton({Key? key, required this.title, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(color??AppColors.primary),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),
      ),
      onPressed: onPressed,
      child:  LWCustomText(
        title: title,
        color: AppColors.whiteColor,
        fontSize: 16.0,
        fontFamily: FontAssets.avertaSemiBold,
      ),
    );
  }
}
