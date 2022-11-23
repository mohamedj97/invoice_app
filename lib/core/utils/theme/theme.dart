import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';

class AppTheme {
  static ThemeData themeData =ThemeData(
    primaryColor: AppColors.primary,
    accentColor: AppColors.secondary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                    primary: AppColors.primary,
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.primary,

          // textStyle: DefaultTextStyle.of(context).style.copyWith(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16.0,
          // ),
        ),
      )
  );
}
/*ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(16),
                            ),
                          ),*/