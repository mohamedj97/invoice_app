import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';

class LWCustomFormFieldWrapper extends StatelessWidget {
  final String? labelText;
  final Widget child;

  LWCustomFormFieldWrapper({
    Key? key,
    this.labelText,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty)
          LWCustomText(
            title: labelText!,
            fontWeight: FontWeight.normal,
            color: AppColors.primary,
            fontSize: 13.0,
            fontFamily: FontAssets.avertaRegular,
          ),
        if (labelText != null && labelText!.isNotEmpty) SizedBox(height: 2.0),
        child,
      ],
    );
  }
}
