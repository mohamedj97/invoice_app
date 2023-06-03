import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import '../../../../core/navigation/custom_page_route.dart';

class PaymentStatusScreen extends StatelessWidget {
  final bool isSuccess;

  const PaymentStatusScreen({Key? key, required this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isSuccess
                      ? const Icon(
                          Icons.check_circle_outline,
                          size: 100.0,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.error_outline,
                          size: 100.0,
                          color: Colors.white,
                        ),
                  const SizedBox(height: 24.0),
                  LWCustomText(
                    title: isSuccess?"payment_successful".tr():"payment_failed".tr(),
                    fontSize: 22.0,
                    fontFamily: FontAssets.avertaSemiBold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                CustomPageRoute.createRoute(
                  page: const LoginScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: LWCustomText(
                title: "proceed".tr(),
                fontSize: 14.0,
                fontFamily: FontAssets.avertaSemiBold,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
