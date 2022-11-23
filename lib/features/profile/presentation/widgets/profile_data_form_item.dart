import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_text_form_field.dart';

class ProfileDataFormItem extends StatelessWidget {
  final String name;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool? isRequired;
  final TextInputType? keyboardType;
  final int? maxLines;

  const ProfileDataFormItem(
      {Key? key,
      required this.name,
      required this.label,
      required this.hintText,
      this.isRequired,
      this.controller,
      this.keyboardType,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.blackColor,
            width: 0.25,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: LWCustomText(
              title: label,
              color: AppColors.labelColor,
              fontSize: 14.0,
              fontFamily: FontAssets.avertaRegular,
            ),
          ),
          LWCustomTextFormField(
            controller: controller,
            isRequired: isRequired ?? false,
            name: name,
            labelText: "",
            isCard: false,
            showLabel: false,
            maxLines: maxLines ?? 1,
            keyboardType: keyboardType ?? TextInputType.text,
            borderDecoration: InputBorder.none,
            validators: [],
            hintText: hintText,
            fontSize: 17.0,
          ),
        ],
      ),
    );
  }
}
