import 'package:flutter/material.dart';

import '../assets/image_assets.dart';
import '../popups/adaptive_alert_dialog.dart';

Future<T?> showAdaptiveErrorDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  String? dismissText,
  bool barrierDismissible = true,
}) async {
  return showDialog<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return AdaptiveAlertDialog(
        icon: Image.asset(ImageAssets.noCustomers),
        title: title,
        content: content,
        actions: [
          if (dismissText != null)
            AdaptiveAlertDialogAction(
              isPrimary: true,
              title: dismissText,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
        ],
      );
    },
  );
}
