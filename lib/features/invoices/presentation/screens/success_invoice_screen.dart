import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';

class SuccessInvoiceScreen extends StatelessWidget {
  const SuccessInvoiceScreen({Key? key}) : super(key: key);

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
                children: const [
                  Icon(
                    Icons.check_circle_outline,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 24.0),
                  LWCustomText(
                    title: "Congratulations",
                    fontSize: 22.0,
                    fontFamily: FontAssets.avertaSemiBold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(height: 24.0),
                  LWCustomText(
                    title: "Your Invoice submitted successfully",
                    fontSize: 17.0,
                    color: AppColors.whiteColor,
                    fontFamily: FontAssets.avertaSemiBold,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const LWCustomText(
            title: "You Can View All Invoice Details Right Now",
            fontSize: 14.0,
            fontFamily: FontAssets.avertaSemiBold,
            color: AppColors.blackColor,
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
                  page: const HomeScreen(),
                ),
                    (Route<dynamic> route) => false,
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: LWCustomText(
                title: "View Invoice Details",
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
