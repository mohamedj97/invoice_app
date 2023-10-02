import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/widgets/custom_tool_tip_shape.dart';
import '../../domain/entities/invoice_head_model.dart';

class InvoiceListItem extends StatelessWidget {
  final InvoiceHeadModel invoice;
  final void Function()? onTap;
  final void Function(String)? onSelected;

  const InvoiceListItem({Key? key, required this.invoice, this.onTap, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                    title: "${'Invoice_number'.tr()} ${invoice.invoiceNo.toString()}",
                    color: AppColors.labelColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 14.0,
                  ),
                  LWCustomText(
                    title: "${invoice.totalAmount.toString()} ${'currency_egp'.tr()}",
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
                    title: "${'to'.tr()} : ${invoice.customerName ?? "NA"}",
                    color: AppColors.disabledBottomItemColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 12.0,
                  ),
                  LWCustomText(
                    title: DateFormat('MMM dd,yyyy  HH:mm a').format(invoice.invoiceDate.toLocal()),
                    color: AppColors.disabledBottomItemColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 12.0,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: AppColors.lightGreenColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: LWCustomText(
                        title: invoice.status ?? "NA",
                        color: AppColors.greenColor,
                        fontSize: 10.0,
                        fontFamily: FontAssets.avertaSemiBold,
                      ),
                    ),
                  ),
                  PopupMenuButton(
                      shape: const TooltipShape(),
                      iconSize: 30,
                      color: AppColors.primary,
                      offset: const Offset(-4, 50),
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColors.primary,
                      ),
                      onSelected: onSelected,
                      itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: "delete",
                              child: LWCustomText(
                                title: "delete_invoice".tr(),
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            PopupMenuItem(
                              value: "download",
                              child: LWCustomText(
                                title: "download_invoice".tr(),
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 0.5,
                  height: 0.0,
                  color: AppColors.searchBarColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
