import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../payment/domain/entities/get_company_subscribtions_resutlt.dart';
import '../../../payment/presentation/screens/payments_screen.dart';

class CompanySubscriptionItem extends StatelessWidget {
  final SubscriptionPayment invoice;

  const CompanySubscriptionItem({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: "${'plan_name'.tr()}:",
                  color: AppColors.primary,
                  fontFamily: FontAssets.avertaRegular,
                  fontSize: 14.0,
                ),
                LWCustomText(
                  title: invoice.planName.toString(),
                  color: AppColors.primary,
                  fontFamily: FontAssets.avertaRegular,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: "${'plan_period'.tr()}:",
                  color: AppColors.disabledBottomItemColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontSize: 14.0,
                ),
                LWCustomText(
                  title: "${invoice.planDuration.toString()} ${"days".tr()}",
                  color: AppColors.disabledBottomItemColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: "${'Invoice_number'.tr()} ${invoice.invoiceNo.toString()}",
                  color: AppColors.labelColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontSize: 14.0,
                ),
                LWCustomText(
                  title: "${invoice.amount.toString()} ${'currency_egp'.tr()}",
                  color: AppColors.labelColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: "${'by'.tr()} : ${invoice.paidBy ?? "NA"}",
                  color: AppColors.disabledBottomItemColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontSize: 14.0,
                ),
                LWCustomText(
                  title: DateFormat('MMM dd,yyyy').format(invoice.date.toLocal()),
                  color: AppColors.disabledBottomItemColor,
                  fontFamily: FontAssets.avertaRegular,
                  fontSize: 14.0,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: invoice.status ? AppColors.babyBlueColor : AppColors.disabledBottomItemColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LWCustomText(
                      title: invoice.status ? "paid".tr() : "not_paid".tr(),
                      color: AppColors.labelColor,
                      fontSize: 12.0,
                      fontFamily: FontAssets.avertaSemiBold,
                    ),
                  ),
                ),
                invoice.status
                    ? const SizedBox.shrink()
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CustomPageRoute.createRoute(
                              page: PaymentScreen(invoiceId: invoice.id),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LWCustomText(
                              title: "pay".tr(),
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(
                              Icons.payment,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(
              thickness: 0.5,
              height: 0.0,
              color: AppColors.searchBarColor,
            ),
          ],
        ),
      ),
    );
  }
}
