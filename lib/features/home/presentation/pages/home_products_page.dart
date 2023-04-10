import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/common_widgets/search_bar.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../products/data/models/requests/get_products_request_model.dart';
import '../../../products/domain/entities/item_filter.dart';
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
  bool isSearch = true;
  int pageNo = 2;
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    cubit.getProducts(ProductFilterGenericFilterModel(pageNo: 1, pageSize: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductsCubit>.value(
      value: cubit,
      child: BlocConsumer<GetProductsCubit, GetProductsState>(listener: (context, state) async {
        if (state.getProductsRequestState == RequestState.error) {
          getErrorDialogue(
            context: context,
            isUnAuthorized: state.getProductsResponse!.statuscode == 401,
            message: state.getProductsResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        products.addAll(state.getProductsResponse?.result?.items ?? []);
        return Column(
          children: [
            SearchBar(
              onChanged: (value) async {
                _debounce(() async {
                  setState(() {
                    products.clear();
                    isSearch = true;
                  });
                  await BlocProvider.of<GetProductsCubit>(context).getProducts(
                    ProductFilterGenericFilterModel(
                      pageSize: 10,
                      pageNo: 1,
                      filter: ItemFilter(
                        name: searchController.text,
                      ),
                    ),
                  );
                  setState(() {
                    pageNo = 2;
                  });
                });
              },
              searchController: searchController,
              searchHintText: "search_for_products".tr(),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: RefreshConfiguration(
                footerBuilder: () => ClassicFooter(
                  loadingIcon: const CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: AppColors.primary,
                  ),
                  loadingText: "${'loading'.tr()}...",
                  height: 100,
                ),
                child: Scrollbar(
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () async {
                      searchController.clear();
                      setState(() {
                        products.clear();
                      });
                      await BlocProvider.of<GetProductsCubit>(context)
                          .getProducts(ProductFilterGenericFilterModel(pageSize: 10, pageNo: 1));
                      setState(() {
                        pageNo = 2;
                      });
                      refreshController.refreshCompleted();
                    },
                    onLoading: () async {
                      setState(() {
                        isSearch = false;
                      });
                      await BlocProvider.of<GetProductsCubit>(context).getProducts(
                        ProductFilterGenericFilterModel(
                          pageSize: 10,
                          pageNo: pageNo,
                          filter: ItemFilter(
                            name: searchController.text,
                          ),
                        ),
                      );
                      setState(() {
                        pageNo++;
                      });
                      refreshController.loadComplete();
                    },
                    enablePullUp:
                        state.getProductsResponse?.result?.listMetadata.totalPages == pageNo - 1 ? false : true,
                    child: state is GetProductsLoading && pageNo - 1 == 1 && isSearch
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : products.isEmpty
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height / 1.5,
                                child: EmptyScreen(
                                  title: "no_products".tr(),
                                  subtitle: "no_products_subtitle".tr(),
                                  imageString: ImageAssets.noProducts,
                                ),
                              )
                            : ListView.builder(
                                itemCount: products.length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (index == products.length - 1) {
                                    return ProductTileItem(product: products[index], showDivider: false);
                                  } else {
                                    return ProductTileItem(product: products[index]);
                                  }
                                },
                              ),
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
