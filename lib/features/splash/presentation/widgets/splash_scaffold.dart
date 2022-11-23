import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/image_assets.dart';

class SplashScaffold extends StatelessWidget {
  final Widget body;
  const SplashScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.splashBG),
          fit: BoxFit.cover,
        ),
      ),
      child: body,
    );
  }
}
