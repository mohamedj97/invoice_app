import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/features/invoices/domain/entities/invoice_head_model.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';

class InvoiceListItem extends StatelessWidget {
  final InvoiceHeadModel invoice;
  const InvoiceListItem({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(CustomPageRoute.createRoute(
            page: CreateEditInvoiceScreen()));
      },
      child: Container(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LWCustomText(
                    title: invoice.id.toString(),
                    color: AppColors.labelColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 14.0,
                  ),
                  LWCustomText(
                    title: "${invoice.totalAmount.toString()} EGP",
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
                    title: "To : ${invoice.customerName??"NA"}",
                    color: AppColors.disabledBottomItemColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 12.0,
                  ),
                  LWCustomText(
                    title: invoice.invoiceDate.toString(),
                    color: AppColors.disabledBottomItemColor,
                    fontFamily: FontAssets.avertaRegular,
                    fontSize: 12.0,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Container(
                  color: AppColors.lightGreenColor,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: LWCustomText(
                      title: invoice.status??"NA",
                      color: AppColors.greenColor,
                      fontSize: 10.0,
                      fontFamily: FontAssets.avertaSemiBold,
                    ),
                  )),
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
