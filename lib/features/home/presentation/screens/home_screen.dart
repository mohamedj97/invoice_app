import 'package:flutter/material.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/customers/presentation/screens/add_customer_screen.dart';
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
          ? "menu"
          : BottomAppBarItemsData.labelList[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add,color: AppColors.whiteColor), //icon inside button
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: pageIndex,
        onChanged: (index) => setState(() {
          pageIndex = index;
          _controller.jumpToPage(index);
        }),
      ),
      actions: [
        InkWell(
          onTap: () async{
            if (pageIndex == 0) {
              Navigator.of(context).push(CustomPageRoute.createRoute(
                  page: const AddCustomerScreen()));
            }
            if (pageIndex == 1) {
              Navigator.of(context).push(CustomPageRoute.createRoute(
                  page: const CreateEditInvoiceScreen()));
            }
            if (pageIndex == 2) {
              Navigator.of(context).push(CustomPageRoute.createRoute(
                  page: const AddEditProductScreen()));
            }
            if (pageIndex == 3) {
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
