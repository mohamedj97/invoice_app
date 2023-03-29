import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "pricing".tr(),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Image.asset(ImageAssets.pricingOne),
            Image.asset(ImageAssets.pricingTwo),
          ],
        ));
  }
}
