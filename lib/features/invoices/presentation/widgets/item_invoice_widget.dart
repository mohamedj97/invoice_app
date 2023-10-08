import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import '../../domain/entities/invoice_line.dart';

class ItemInvoiceWidget extends StatelessWidget {
  final Line item;
  final String name;
  final bool lastItem;

  const ItemInvoiceWidget(
      {Key? key, required this.item, required this.name, this.lastItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          trailing: LWCustomText(
            title: "${item.priceEgp * item.quantity} EGP",
            fontFamily: FontAssets.avertaSemiBold,
            color: AppColors.labelColor,
            fontSize: 14.0,
          ),
          title: LWCustomText(
            title: name,
            fontFamily: FontAssets.avertaRegular,
            color: AppColors.labelColor,
            fontSize: 14.0,
          ),
          subtitle: LWCustomText(
            title: item.itemDescription??"",
            color: AppColors.searchBarColor,
            fontFamily: FontAssets.avertaRegular,
            fontSize: 12.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: LWCustomText(
            title: "${item.quantity} x ${item.priceEgp}",
            fontFamily: FontAssets.avertaRegular,
            color: AppColors.primary,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(height: 16.0),
        lastItem
            ? const Divider(
                thickness: 0.5,
                height: 0.0,
                color: AppColors.searchBarColor,
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 0.5,
                  height: 0.0,
                  color: AppColors.searchBarColor,
                ),
              ),
      ],
    );
  }
}
