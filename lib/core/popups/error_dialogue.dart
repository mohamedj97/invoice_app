import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../api/repository/disk_repo.dart';
import '../api/repository/memory_repo.dart';
import '../assets/colors.dart';
import '../assets/font_assets.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/lw_custom_text.dart';
import '../navigation/custom_page_route.dart';

Future<void> getErrorDialogue(
    {required String message,
    required bool isUnAuthorized,
    required BuildContext context}) async {
  if (isUnAuthorized) {
    await DiskRepo().deleteTokensData();
    MemoryRepo().deleteTokensData();
    Navigator.of(context).pushAndRemoveUntil(
      CustomPageRoute.createRoute(
        page: const LoginScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 10.0,
        title: isUnAuthorized
            ? LWCustomText(
                textAlign: TextAlign.center,
                title: "session_timeout".tr(),
                color: AppColors.dialogueTitleColor,
                fontFamily: FontAssets.avertaSemiBold,
                fontSize: 16.0,
              )
            : const Icon(
                Icons.warning,
                color: AppColors.primary,
                size: 80.0,
              ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LWCustomText(
                title: message,
                fontSize: 14.0,
                fontFamily: FontAssets.avertaRegular),
            const SizedBox(height: 24.0),
            SizedBox(
              width: 300,
              child: CustomElevatedButton(
                title: isUnAuthorized ? "login".tr() : "cancel".tr(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
