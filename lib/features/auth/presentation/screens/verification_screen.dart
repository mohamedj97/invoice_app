import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/auth/presentation/screens/profile_data_screen.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/custom_back_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController? otpTEC;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "verification".tr(),
      backGroundColor: Colors.white,
      leading: const CustomBackButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LWCustomText(
              title: "email_verification".tr(),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 32.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: "we_sent_a_code_to".tr(),
                  color: AppColors.searchBarColor,
                  fontSize: 16.0,
                ),
                const SizedBox(width: 8.0),
                const Expanded(
                  child: LWCustomText(
                    title: "ahmed7ragab10@gmail.com",
                    color: AppColors.primary,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            LWCustomText(
              title: "please_write_down".tr(),
              color: AppColors.searchBarColor,
              fontSize: 16.0,
            ),
            const SizedBox(height: 32.0),
            Center(
              child: PinCodeTextField(
                controller: otpTEC,
                hasUnderline: false,
                autofocus: true,
                highlightColor: Colors.red,
                defaultBorderColor: Colors.green,
                hasTextBorderColor: Colors.yellow,
                highlightPinBoxColor: const Color.fromRGBO(246, 246, 247, 1),
                pinBoxColor: const Color.fromRGBO(246, 246, 247, 1),
                maxLength: 4,
                pinBoxWidth: 60,
                pinBoxHeight: 60,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: const TextStyle(fontSize: 12.0, color: AppColors.dataFieldColor),
                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                pinBoxBorderWidth: 1,
                pinBoxRadius: 8,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomElevatedButton(
                title: "verify".tr(),
                onPressed: () {
                  Navigator.of(context).push(
                      CustomPageRoute.createRoute(page: const ProfileDataScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
