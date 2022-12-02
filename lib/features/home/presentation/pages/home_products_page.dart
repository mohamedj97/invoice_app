import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/common_widgets/search_bar.dart';
import 'package:invoice_app/core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../products/presentation/cubit/get_products_cubit.dart';
import '../../../products/presentation/widgets/product_tile_item.dart';

class HomeProductsPage extends StatelessWidget {
  const HomeProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocProvider<GetProductsCubit>(
      create: (context) => sl<GetProductsCubit>()..getProducts(),
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
          listener: (context, state) async {
        if (state.getProductsRequestState == RequestState.error) {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Icon(
                  Icons.warning,
                  color: AppColors.primary,
                  size: 80.0,
                ),
                content: Text(state.getProductsResponse?.message ??
                    "something_went_wrong".tr()),
                actions: [
                  TextButton(
                    child: LWCustomText(
                      title: "cancel".tr(),
                      fontFamily: FontAssets.avertaSemiBold,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        }
      }, builder: (context, state) {
        return state.getProductsResponse!.result!.result.isEmpty
            ? EmptyScreen(
          title: "no_products".tr(),
          subtitle: "no_products_subtitle".tr(),
          imageString: ImageAssets.noProducts,
        )
            : Column(
          children: [
            SearchBar(
              searchController: searchController,
              searchHintText: "search_for_products".tr(),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: state is GetProductsLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      color: AppColors.scaffoldColor,
                      child: ListView.builder(
                        itemCount:
                            state.getProductsResponse?.result?.result.length ??
                                0,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index ==
                              state.getProductsResponse!.result!.result.length -
                                  1) {
                            return ProductTileItem(
                                product: state
                                    .getProductsResponse!.result!.result[index],
                                showDivider: false);
                          } else {
                            return ProductTileItem(
                                product: state.getProductsResponse!.result!
                                    .result[index]);
                          }
                        },
                      ),
                    ),
            )
          ],
        );
      }),
    );
  }
}
