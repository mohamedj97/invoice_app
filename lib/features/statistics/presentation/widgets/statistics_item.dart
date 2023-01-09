import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';

import '../../domain/entities/invoices_totals.dart';

class StatisticsItem extends StatelessWidget {
  final Color? backgroundColor;
  final InvoicesTotals? invoicesTotals;
  final String title;

  const StatisticsItem(
      {Key? key, this.backgroundColor = AppColors.whiteColor, this.invoicesTotals, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        children: [
          LWCustomText(
            title: title,
            fontSize: 16.0,
            color: AppColors.blackColor,
            fontFamily: FontAssets.avertaRegular,
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.tabTitleColor),
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    LWCustomText(
                      title: "total_amount".tr(),
                      fontSize: 16.0,
                      color: AppColors.blackColor,
                      fontFamily: FontAssets.avertaSemiBold,
                    ),
                    Row(
                      children: [
                        LWCustomText(
                          title: invoicesTotals?.totalSales.toString() ?? "0.0",
                          fontSize: 40.0,
                          color: AppColors.primary,
                          fontFamily: FontAssets.avertaSemiBold,
                        ),
                        LWCustomText(
                          title: "currency_egp".tr(),
                          fontSize: 16.0,
                          color: AppColors.blackColor,
                          fontFamily: FontAssets.avertaSemiBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.tabTitleColor),
                ),
                child: Column(
                  children: [
                    LWCustomText(
                      title: "tax_amount".tr(),
                      fontSize: 16.0,
                      color: AppColors.blackColor,
                      fontFamily: FontAssets.avertaSemiBold,
                    ),
                    Row(
                      children: [
                        LWCustomText(
                          title: invoicesTotals?.totalTax.toString() ?? "0.0",
                          fontSize: 40.0,
                          color: AppColors.primary,
                          fontFamily: FontAssets.avertaSemiBold,
                        ),
                        LWCustomText(
                          title: "currency_egp".tr(),
                          fontSize: 16.0,
                          color: AppColors.blackColor,
                          fontFamily: FontAssets.avertaSemiBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
