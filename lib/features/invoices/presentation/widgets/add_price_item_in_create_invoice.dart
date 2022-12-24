import 'package:flutter/material.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_text_form_field.dart';

class AddPriceItemInCreateInvoice extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String? currency;
  final String name;
  final String? initialValue;
  final String? hintText;
  final bool showCurrency;

  const AddPriceItemInCreateInvoice(
      {Key? key,
      this.controller,
        this.hintText,
      required this.title,
      this.currency,
      required this.name, this.initialValue, this.showCurrency=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LWCustomText(
                  title: title,
                  color: AppColors.labelColor,
                  fontFamily: FontAssets.avertaRegular,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: LWCustomTextFormField(
                        textAlign: TextAlign.end,
                        name: name,
                        showLabel: false,
                        controller: controller,
                        labelText: "",
                        hintText: hintText??"00.0",
                        initialValue: initialValue,
                        isRequired: true,
                        // initialValue: !hasData
                        //     ? "${widget.productItem!.price} EGP"
                        //     : null,
                        isCard: false,
                        maxLines: 1,
                        keyboardType: const TextInputType.numberWithOptions(),
                        borderDecoration: InputBorder.none,
                      ),
                    ),
                    showCurrency?LWCustomText(
                      title: currency ?? "EGP",
                      color: AppColors.labelColor,
                      fontFamily: FontAssets.avertaRegular,
                    ):const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 0.5,
              height: 0.0,
              color: AppColors.searchBarColor,
            ),
          ),
        ],
      ),
    );
  }
}
