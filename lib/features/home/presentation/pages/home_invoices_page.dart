import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/invoices/domain/entities/invoice.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/utils/enums.dart';
import '../../../invoices/presentation/widgets/invoice_list_item.dart';
import 'package:invoice_app/injection_container.dart' as di;


class HomeInvoicesPage extends StatelessWidget {
  const HomeInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Invoice> invoicesList = [
      Invoice(
        id: "101010",
        price: 100.0,
        toWho: "Ahmed ragab",
        status: "Approved",
        date: DateTime(2022,DateTime.november,3),
        dueDate: DateTime(2022,DateTime.november,3),
        subTotal: 15.0,
        totalSales: 20.0,
        netAmount: 70.0,
        taxTotal: 100.0,
        taxDiscount: 15.0,
        total: 200.0,
      ),
      Invoice(
        id: "88888",
        price: 200.0,
        toWho: "Dalia Ahmed",
        status: "Pending",
        date: DateTime(2022,DateTime.february,2),
        dueDate: DateTime(2022,DateTime.february,2),
        subTotal: 17.0,
        totalSales: 16.0,
        netAmount: 15.0,
        taxTotal: 18.0,
        taxDiscount: 19.0,
        total: 11111.0,
      ),
      Invoice(
        id: "151515",
        price: 200.0,
        toWho: "Mohamed Ahmed",
        status: "Cancelled",
        date: DateTime(2022,DateTime.october,10),
        dueDate: DateTime(2022,DateTime.october,10),
        subTotal: 22.0,
        totalSales: 99.0,
        netAmount: 55.0,
        taxTotal: 77.0,
        taxDiscount: 66.0,
        total: 3333.0,
      ),
    ];
    TextEditingController searchController = TextEditingController();
    return BlocProvider<GetInvoicesCubit>.value(
      value: GetInvoicesCubit(di.sl()),
      child: BlocConsumer<GetInvoicesCubit, GetInvoicesState>(
        listener: (context, state) async
        {
          if (state.getInvoicesRequestState == RequestState.success) {
              Navigator.of(context)
                  .push(CustomPageRoute.createRoute(page: const CreateEditInvoiceScreen()));
          }
          if (state.getInvoicesRequestState == RequestState.error) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Icon(
                    Icons.warning,
                    color: AppColors.primary,
                    size: 80.0,
                  ),
                  content: Text(state.failure ?? "Something Went Wrong"),
                  actions: [
                    TextButton(
                      child: const LWCustomText(
                        title: "Cancel",
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
        },
        builder: (context, state) {
          return Column(
            children: [
              SearchBar(
                searchController: searchController,
                searchHintText: "Search by invoice number",
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: Container(
                  color: AppColors.scaffoldColor,
                  child: ListView.builder(
                    itemCount: invoicesList.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InvoiceListItem(invoice: state.getInvoicesResponse!.result![index]);
                    },
                  ),
                ),
              )
            ],
          );
      },
      ),
    );
  }
}
