import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_local_data_source.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../invoices/data/models/requests/invoice_filter_model.dart';
import '../../../invoices/domain/entities/invoice_head_model.dart';
import '../../../invoices/domain/entities/single_invoice_response.dart';
import '../../../invoices/presentation/widgets/invoice_list_item.dart';

class HomeInvoicesPage extends StatefulWidget {
  const HomeInvoicesPage({Key? key}) : super(key: key);

  @override
  State<HomeInvoicesPage> createState() => _HomeInvoicesPageState();
}

class _HomeInvoicesPageState extends State<HomeInvoicesPage> {
  TextEditingController searchController = TextEditingController();
  List<InvoiceHeadModel> invoices = [];
  final cubit = GetInvoicesCubit(sl(), sl(), sl());
  bool tapped = false;
  SingleInvoiceResponse? singleInvoiceResponse;

  @override
  void initState() {
    if (InvoicesLocalDataSource.status != null ||
        InvoicesLocalDataSource.invoiceDate != null ||
        InvoicesLocalDataSource.customerId != null) {
      cubit.filterInvoices(InvoiceFilterModel(
        status: InvoicesLocalDataSource.status,
        customerName: InvoicesLocalDataSource.customerName,
        customerId: InvoicesLocalDataSource.customerId,
        invoiceDate: InvoicesLocalDataSource.invoiceDate,
      ));
    } else {
      cubit.getInvoices();
    }
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetInvoicesCubit>.value(
      value: cubit,
      child: BlocConsumer<GetInvoicesCubit, GetInvoicesState>(
        listener: (context,
            state) async {
          if(state.getInvoicesRequestState == RequestState.success && tapped)
          {
            singleInvoiceResponse = state.getSingleInvoiceResponse?.result ;
            setState(() {
              if(singleInvoiceResponse !=null)
              {
                InvoicesLocalDataSource.addedItems = singleInvoiceResponse?.lines ??[];
                InvoicesLocalDataSource.customerName = null;
                InvoicesLocalDataSource.customerId = singleInvoiceResponse!.customerId;
                InvoicesLocalDataSource.invoiceDate = singleInvoiceResponse!.invoiceDate;
              }
            });
            Navigator.of(context).push(
              CustomPageRoute.createRoute(
                page: CreateEditInvoiceScreen(
                  invoice: singleInvoiceResponse,
                ),
              ),
            );
          }
          if (state.getInvoicesRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getInvoicesResponse!.statuscode == 401,
              message: state.getInvoicesResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          invoices = state.getInvoicesResponse?.result?.result
                  .where((invoice) => invoice.id.toString().contains(searchController.text))
                  .toList() ??
              state.getInvoicesResponse?.result?.result ??
              [];
          return Column(
            children: [
              SearchBar(
                enabled: state is! GetInvoicesLoading,
                onChanged: (value) {
                  if (value.isEmptyOrNull) {
                    setState(() {
                      invoices = state.getInvoicesResponse?.result?.result ?? [];
                    });
                  } else {
                    setState(() {
                      invoices =
                          invoices.where((invoice) => invoice.id.toString().contains(searchController.text)).toList();
                    });
                  }
                },
                searchController: searchController,
                searchHintText: "search_for_invoices".tr(),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: state is GetInvoicesLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : invoices.isEmpty
                        ? RefreshIndicator(
                            onRefresh: () async {
                              await BlocProvider.of<GetInvoicesCubit>(context).getInvoices();
                              setState(() {
                                InvoicesLocalDataSource.status = null;
                                InvoicesLocalDataSource.customerName = null;
                                InvoicesLocalDataSource.customerId = null;
                                InvoicesLocalDataSource.invoiceDate = null;
                              });
                              searchController.clear();
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 1.5,
                                child: EmptyScreen(
                                  title: "no_invoices".tr(),
                                  subtitle: "no_invoices_subtitle".tr(),
                                  imageString: ImageAssets.noInvoices,
                                ),
                              ),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await BlocProvider.of<GetInvoicesCubit>(context).getInvoices();
                              setState(() {
                                InvoicesLocalDataSource.status = null;
                                InvoicesLocalDataSource.customerName = null;
                                InvoicesLocalDataSource.customerId = null;
                                InvoicesLocalDataSource.invoiceDate = null;
                              });
                              searchController.clear();
                            },
                            child: Container(
                              color: AppColors.scaffoldColor,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: invoices.length,
                                itemBuilder: (context, index) {
                                  return InvoiceListItem(
                                      invoice: invoices[index],
                                      onTap: () async {
                                        setState(() {
                                          tapped = true;
                                        });
                                        await BlocProvider.of<GetInvoicesCubit>(context)
                                            .getSingleInvoice(id: invoices[index].id);
                                      });
                                },
                              ),
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
