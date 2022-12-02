import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/common_widgets/search_bar.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';

import '../../../products/presentation/widgets/product_tile_item.dart';

class HomeProductsPage extends StatelessWidget {
  const HomeProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product("Handball", "Blastic Ball That Players Buy It Much…", 255.00,
          "11111"),
      Product("Small knifes", "Blastic Ball That Players Buy It Much…", 255.00,
          "22222"),
      Product("Sand ball", "Blastic Ball That Players Buy It Much…", 255.00,
          "33333"),
      Product(
          "Keys", "Blastic Ball That Players Buy It Much…", 255.00, "44444"),
      Product("Sand ball", "Blastic Ball That Players Buy It Much…", 255.00,
          "55555"),
      Product(
          "Keys", "Blastic Ball That Players Buy It Much…", 255.00, "66666"),
    ];
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        SearchBar(
          searchController: searchController,
          searchHintText: "search_for_products".tr(),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: Container(
            color: AppColors.scaffoldColor,
            child: ListView.builder(
              itemCount: products.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == products.length - 1) {
                  return ProductTileItem(
                      product: products[index], showDivider: false);
                } else {
                  return ProductTileItem(product: products[index]);
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
