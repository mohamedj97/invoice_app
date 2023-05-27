import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../widgets/pricing_item.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  int selectedIndex = 0;
  List<bool> isSelected = [true, false];

  void onPressed() {
    Navigator.of(context).pushAndRemoveUntil(
      CustomPageRoute.createRoute(
        page: const LoginScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        backGroundColor: AppColors.whiteColor,
        title: "pricing".tr(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  color: AppColors.pricingTextColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.pricingTextColor, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == 0 ? AppColors.primary : AppColors.pricingTextColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.pricingTextColor, width: 1.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LWCustomText(
                              title: 'monthly'.tr(),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == 1 ? AppColors.primary : AppColors.pricingTextColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.pricingTextColor, width: 1.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LWCustomText(
                              title: 'annual'.tr(),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Column(
                children: [
                  if (selectedIndex == 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(
                              color: AppColors.searchBarColor,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            const SizedBox(height: 16.0),
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
                                  fontWeight: FontWeight.w200,
                                  fontFamily: FontAssets.avertaSemiBold,
                                  fontSize: 15.0,
                                  color: AppColors.blackColor,
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
                                const SizedBox(height: 16.0),
                                Divider(
                                  thickness: 0.5,
                                  height: 2.0,
                                  color: AppColors.searchBarColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
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
                            const SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: SizedBox(
                                  width: 300,
                                  child: CustomElevatedButton(
                                    title: "get_started".tr(),
                                    onPressed: onPressed,
                                  )),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  if (selectedIndex == 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            border: Border.all(
                              color: AppColors.searchBarColor,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            const SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                LWCustomText(
                                  title: "business".tr(),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontAssets.avertaSemiBold,
                                  fontSize: 25.0,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(height: 8.0),
                                LWCustomText(
                                  title: "best_settings_for_startup".tr(),
                                  fontFamily: FontAssets.avertaSemiBold,
                                  fontSize: 15.0,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(height: 16.0),
                                Container(
                                  decoration: const BoxDecoration(color: AppColors.whiteColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: LWCustomText(
                                      title: "6,000 ${"currency_egp".tr()}",
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontAssets.avertaSemiBold,
                                      fontSize: 25.0,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Divider(
                                  thickness: 0.5,
                                  height: 2.0,
                                  color: AppColors.searchBarColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                PricingItem(
                                    title: "Up to 10 Active Users",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                                PricingItem(
                                    title: "Up to 30 Project Integrations",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                                PricingItem(
                                    title: "Keen Analytics Platform",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                                PricingItem(
                                    title: "Targets Timelines & Files",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                                PricingItem(
                                    title: "Up to 30 product",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                                PricingItem(
                                    title: "Get up to 3 months Up to 10 Active Users support",
                                    iconColor: AppColors.whiteColor,
                                    textColor: AppColors.whiteColor),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: SizedBox(
                                  width: 300,
                                  child: CustomElevatedButton(
                                    title: "get_started".tr(),
                                    color: AppColors.whiteColor,
                                    textColor: AppColors.primary,
                                    onPressed: onPressed,
                                  )),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomElevatedButton(
                      title: "free_trial".tr(),
                      onPressed: onPressed,
                    )),
              ),
            ],
          ),
        ));
  }
}
