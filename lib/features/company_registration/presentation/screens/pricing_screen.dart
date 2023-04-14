import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';

import '../../../../core/assets/colors.dart';
import '../widgets/pricing_item.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        backGroundColor: AppColors.whiteColor,
        title: "pricing".tr(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(
                            color: AppColors.searchBarColor,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15))
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LWCustomText(
                                title: "startup".tr(),
                                fontWeight: FontWeight.bold,
                                fontFamily: FontAssets.avertaSemiBold,
                                fontSize: 25.0,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(height: 8.0),
                              LWCustomText(
                                title: "best_settings_for_startup".tr(),
                                fontWeight: FontWeight.bold,
                                fontFamily: FontAssets.avertaSemiBold,
                                fontSize: 15.0,
                                color: AppColors.searchBarColor,
                              ),
                              const SizedBox(height: 16.0),
                              Container(
                                decoration: BoxDecoration(color: AppColors.babyBlueColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: LWCustomText(
                                    title: "3,000 ${"currency_egp".tr()}",
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontAssets.avertaSemiBold,
                                    fontSize: 25.0,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1.5,
                                height: 2.0,
                                color: AppColors.searchBarColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: const [
                             PricingItem(title: "Up to 10 Active Users"),
                             PricingItem(title: "Up to 30 Project Integrations"),
                             PricingItem(title: "Keen Analytics Platform"),
                             PricingItem(title: "Targets Timelines & Files"),
                             PricingItem(title: "Up to 30 product"),
                             PricingItem(title: "Get up to 3 months Up to 10 Active Users support"),
                           ],
                         ),
                          CustomElevatedButton(title: "get_started".tr())
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                        border: Border.all(
                          color: AppColors.searchBarColor,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LWCustomText(
                              title: "business".tr(),
                              fontWeight: FontWeight.bold,
                              fontFamily: FontAssets.avertaSemiBold,
                              fontSize: 25.0,
                              color: AppColors.blackColor,
                            ),
                            LWCustomText(
                              title: "best_settings_for_startup".tr(),
                              fontWeight: FontWeight.bold,
                              fontFamily: FontAssets.avertaSemiBold,
                              fontSize: 15.0,
                              color: AppColors.searchBarColor,
                            ),
                            Container(
                              decoration: BoxDecoration(color: AppColors.babyBlueColor),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: LWCustomText(
                                  title: "3,000 ${"currency_egp".tr()}",
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontAssets.avertaSemiBold,
                                  fontSize: 25.0,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const Divider(color: AppColors.searchBarColor,thickness: 1.5,),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            PricingItem(title: "Up to 10 Active Users"),
                            PricingItem(title: "Up to 30 Project Integrations"),
                            PricingItem(title: "Keen Analytics Platform"),
                            PricingItem(title: "Targets Timelines & Files"),
                            PricingItem(title: "Up to 30 product"),
                            PricingItem(title: "Get up to 3 months Up to 10 Active Users support"),
                          ],
                        ),
                        CustomElevatedButton(title: "get_started".tr(),color: AppColors.whiteColor)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(title: "free_trial".tr()),
          ],
        ));
  }
}
