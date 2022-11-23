import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class PrimaryAndSecondaryButton extends StatelessWidget {
  final String primaryTitle;
  final String secondaryTitle;
  final void Function() primaryOnPressed;
  final void Function() secondaryOnPressed;

  const PrimaryAndSecondaryButton({Key? key, required this.primaryTitle, required this.secondaryTitle, required this.primaryOnPressed, required this.secondaryOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 8.0),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.white),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              onPressed: secondaryOnPressed,
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: LWCustomText(
                  title: secondaryTitle,
                  color: AppColors.primary,
                  fontSize: 14.0,
                  fontFamily: FontAssets.avertaSemiBold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.primary),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              onPressed: primaryOnPressed,
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: LWCustomText(
                  title: primaryTitle,
                  color: AppColors.whiteColor,
                  fontSize: 14.0,
                  fontFamily: FontAssets.avertaSemiBold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
