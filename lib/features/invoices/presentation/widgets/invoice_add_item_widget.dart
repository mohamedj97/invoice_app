import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class InvoiceAddItemWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  const InvoiceAddItemWidget({Key? key, required this.title, required this.iconData, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(iconData,color: AppColors.primary,size: 40.0,),
                  const SizedBox(width: 8.0),
                  LWCustomText(title: title,color: AppColors.primary,fontFamily: FontAssets.avertaSemiBold,fontSize: 14.0,)
                ],
              ),
              const Icon(Icons.keyboard_arrow_right_outlined,color: AppColors.iconsColor,size: 35.0,),
            ],
          ),
        ),
      ),
    );
  }
}
