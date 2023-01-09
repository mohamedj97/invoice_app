import 'package:flutter/material.dart';

import '../assets/colors.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap??(){
          Navigator.pop(context);
        },
        child:  const Icon(Icons.arrow_back_ios, color: AppColors.blackColor));
  }
}
