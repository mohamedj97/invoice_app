import 'package:flutter/material.dart';

import '../assets/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child:  const Icon(Icons.arrow_back_ios, color: AppColors.blackColor));
  }
}
