import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';


class NavigationBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const NavigationBarItem({Key? key, required this.title, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 24,
          color: color,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LWCustomText(
            title: title,
            fontSize: 10.0,
            fontFamily: FontAssets.avertaRegular,
          ),
        )
      ],
    );
  }
}
