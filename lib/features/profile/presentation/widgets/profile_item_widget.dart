import 'package:flutter/material.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String? imagePath;
  final bool? showDivider;
  final void Function()? onTap;
  final Color? color;

  const ProfileItemWidget(
      {Key? key,
      required this.title,
        this.imagePath,
      this.onTap,
      this.color, this.showDivider=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.whiteColor,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if(imagePath !=null)Image.asset(imagePath!,height: 30,width: 30,),
                      const SizedBox(width: 16.0),
                      LWCustomText(
                          title: title, color: color ?? AppColors.profileItemColor),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right_outlined,
                      color: color ?? AppColors.profileItemColor, size: 35.0),
                ],
              ),
            ),
          ),
        ),
        if(showDivider!)const Divider(color: AppColors.pricingTextColor),
      ],
    );
  }
}
