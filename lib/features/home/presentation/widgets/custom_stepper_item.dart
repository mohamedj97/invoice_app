import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/font_assets.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class CustomStepperItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showLine;
  const CustomStepperItem({Key? key, required this.title, required this.subTitle, this.showLine=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.checkColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(3.0),
                child: const Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 4.0),
              showLine?const DottedDashedLine(height: 70, width: 0, axis: Axis.vertical):const SizedBox.shrink()
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LWCustomText(
                  title: title,
                  color: AppColors.primary,
                  fontSize: 16.0,
                ),
                const SizedBox(height: 24.0),
                LWCustomText(
                  title: subTitle,
                  fontFamily: FontAssets.avertaRegular,
                  color: AppColors.dialogueTitleColor,
                  fontSize: 13.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
