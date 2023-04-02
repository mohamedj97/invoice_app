import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/home/presentation/pages/home_dasboard_page.dart';
import 'package:invoice_app/features/home/presentation/pages/home_invoices_page.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_local_data_source.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import 'package:invoice_app/features/invoices/presentation/screens/filter_screen.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../utils/static_const_data/bottom_nav_bar_items_date.dart';
import '../../../products/presentation/screens/add_edit_product_screen.dart';
import '../pages/home_more_page.dart';
import '../pages/home_products_page.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final int? index;

  const HomeScreen({super.key, this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      pageIndex = widget.index!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: widget.index ?? 0);
    return CustomScaffold(
      showAppbar: pageIndex != 0,
      backGroundColor: AppColors.whiteColor,
      title: pageIndex == 3 ? "menu".tr() : BottomAppBarItemsData.labelList[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.of(context).push(CustomPageRoute.createRoute(page: const CreateEditInvoiceScreen()));
        },
        child: const Icon(Icons.add, color: AppColors.whiteColor), //icon inside button
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: pageIndex,
        onChanged: (index) => setState(() {
          pageIndex = index;
          controller.jumpToPage(index);
        }),
      ),
      leading: pageIndex == 1
          ? IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CustomPageRoute.createRoute(
                    page: const FilterScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(IconAssets.filterIcon))
          : const SizedBox(),
      actions: pageIndex == 0 || pageIndex == 3
          ? null
          : [
              InkWell(
                onTap: () async {
                  if (pageIndex == 1) {
                    InvoicesLocalDataSource.clearData();
                    Navigator.of(context).push(CustomPageRoute.createRoute(page: const CreateEditInvoiceScreen()));
                  }
                  if (pageIndex == 2) {
                    Navigator.of(context).push(CustomPageRoute.createRoute(page: const AddEditProductScreen()));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.add,
                    size: 25.0,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
      body: PageView(
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
            controller.jumpToPage(index);
          });
        },
        controller: controller,
        children: const [
          HomeDashboardPage(),
          HomeInvoicesPage(),
          HomeProductsPage(),
          HomeMorePage(),
        ],
      ),
    );
  }
}
