import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget body;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final double? leadingWidth;
  final Widget? floatingActionButton;
  final Color? backGroundColor;
  final bool showAppbar;

  const CustomScaffold({
    Key? key,
    required this.title,
    this.actions,
    required this.body,
    this.leading,
    this.leadingWidth,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backGroundColor, this.showAppbar=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backGroundColor ?? AppColors.scaffoldColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
      appBar: showAppbar? AppBar(
        leading: leading,
        leadingWidth: leadingWidth,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary, width: 0.5),
        ),
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        title: LWCustomText(
          title: title,
          fontFamily: FontAssets.avertaSemiBold,
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: AppColors.blackColor,
        ),
        centerTitle: true,
        actions: actions,
      ):null,
      body: body,
    );
  }
}
