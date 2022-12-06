import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/common_widgets/search_bar.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../products/presentation/cubit/get_products_cubit.dart';
import '../../../products/presentation/widgets/product_tile_item.dart';

class HomeProductsPage extends StatefulWidget {
  const HomeProductsPage({Key? key}) : super(key: key);

  @override
  State<HomeProductsPage> createState() => _HomeProductsPageState();
}

class _HomeProductsPageState extends State<HomeProductsPage> {
  List<Product> products = [];
  TextEditingController searchController = TextEditingController();
  final cubit = GetProductsCubit(sl());

  @override
  void initState() {
    cubit.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductsCubit>.value(
      value: cubit,
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
          listener: (context, state) async {
        if (state.getProductsRequestState == RequestState.error) {
          getErrorDialogue(
            context: context,
            isUnAuthorized: state.getProductsResponse!.statuscode==401,
            message: state.getProductsResponse?.message ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        products = state.getProductsResponse?.result?.result
                .where((product) =>
                    product.name.toLowerCase().contains(searchController.text))
                .toList() ??
            state.getProductsResponse?.result?.result ??
            [];
        return Column(
          children: [
            SearchBar(
              onChanged: (value) {
                if (value.isEmptyOrNull) {
                  setState(() {
                    products = state.getProductsResponse?.result?.result ?? [];
                  });
                } else {
                  //searchDebouncer(() {
                  setState(() {
                    products = products
                        .where((product) => product.name
                            .toLowerCase()
                            .contains(searchController.text))
                        .toList();
                  });
                  // });
                }
              },
              searchController: searchController,
              searchHintText: "search_for_products".tr(),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: state is GetProductsLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : products.isEmpty
                      ? EmptyScreen(
                          title: "no_products".tr(),
                          subtitle: "no_products_subtitle".tr(),
                          imageString: ImageAssets.noProducts,
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await BlocProvider.of<GetProductsCubit>(context)
                                .getProducts();
                            searchController.clear();
                          },
                          child: Container(
                            color: AppColors.scaffoldColor,
                            child: ListView.builder(
                              itemCount: products.length,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index == products.length - 1) {
                                  return ProductTileItem(
                                      product: products[index],
                                      showDivider: false);
                                } else {
                                  return ProductTileItem(
                                      product: products[index]);
                                }
                              },
                            ),
                          ),
                        ),
            )
          ],
        );
      }),
    );
  }
}
