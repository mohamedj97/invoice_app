import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/home/presentation/pages/home_dasboard_page.dart';
import 'package:invoice_app/features/home/presentation/pages/home_invoices_page.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../utils/static_const_data/bottom_nav_bar_items_date.dart';
import '../../../products/presentation/screens/add_edit_product_screen.dart';
import '../pages/home_more_page.dart';
import '../pages/home_products_page.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: pageIndex == 3
          ? "menu".tr()
          : BottomAppBarItemsData.labelList[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.of(context).push(CustomPageRoute.createRoute(
              page: const CreateEditInvoiceScreen()));
        },
        child: const Icon(Icons.add,
            color: AppColors.whiteColor), //icon inside button
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: pageIndex,
        onChanged: (index) => setState(() {
          pageIndex = index;
          _controller.jumpToPage(index);
        }),
      ),
      actions: pageIndex == 0 || pageIndex == 3
          ? null
          : [
              InkWell(
                onTap: () async {
                  if (pageIndex == 1) {
                    Navigator.of(context).push(CustomPageRoute.createRoute(
                        page: const CreateEditInvoiceScreen()));
                  }
                  if (pageIndex == 2) {
                    Navigator.of(context).push(CustomPageRoute.createRoute(
                        page: const AddEditProductScreen()));
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
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
            _controller.jumpToPage(index);
          });
        },
        controller: _controller,
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
