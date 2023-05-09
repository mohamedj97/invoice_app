import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';

import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/assets/colors.dart';
import '../screens/add_edit_product_screen.dart';

class ProductTileItem extends StatelessWidget {
  final Product product;
  final bool showDivider;

  const ProductTileItem({Key? key, required this.product, this.showDivider = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CustomPageRoute.createRoute(page: AddEditProductScreen(productItem: product)));
      },
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8.0),
                if (product.image == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Image.asset(
                      ImageAssets.splashImage,
                      color: AppColors.primary,
                      height: 100,
                      width: 100,
                    ),
                  )
                else
                  Image.network(
                    product.image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: LWCustomText(
                                title: product.name,
                                color: AppColors.labelColor,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                            ),
                            LWCustomText(
                              title: "${product.price ?? "NA"} ${'currency_egp'.tr()}",
                              color: AppColors.labelColor,
                              fontFamily: FontAssets.avertaRegular,
                            )
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: LWCustomText(
                            title: product.description ?? "NA",
                            color: AppColors.searchBarColor,
                            fontFamily: FontAssets.avertaRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showDivider) const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
