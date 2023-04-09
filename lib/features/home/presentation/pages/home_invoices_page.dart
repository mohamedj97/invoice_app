import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_local_data_source.dart';
import 'package:invoice_app/features/invoices/domain/entities/invoice_filter.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../invoices/data/models/requests/get_invoices_request_model.dart';
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
  final cubit = GetInvoicesCubit(sl(), sl());
  bool tapped = false;
  bool isSearch = true;
  int pageNo = 2;
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));
  SingleInvoiceResponse? singleInvoiceResponse;
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    if (InvoicesLocalDataSource.status != null ||
        InvoicesLocalDataSource.invoiceDate != null ||
        InvoicesLocalDataSource.customerId != null) {
      cubit.getInvoices(InvoiceFilterGenericFilterModel(
        pageSize: 10,
        pageNo: 1,
        filter: InvoiceFilter(
          customerId: InvoicesLocalDataSource.customerId,
          customerName: InvoicesLocalDataSource.customerName,
          invoiceDateFrom: InvoicesLocalDataSource.invoiceDate,
          statusId: InvoicesLocalDataSource.status,
        ),
      ));
    } else {
      cubit.getInvoices(InvoiceFilterGenericFilterModel(pageSize: 10, pageNo: 1));
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
        listener: (context, state) async {
          if (state.getInvoicesRequestState == RequestState.success && tapped) {
            singleInvoiceResponse = state.getSingleInvoiceResponse?.result;
            setState(() {
              if (singleInvoiceResponse != null) {
                InvoicesLocalDataSource.addedItems = singleInvoiceResponse?.lines ?? [];
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
          invoices.addAll(state.getInvoicesResponse?.result?.invoices ?? []);
          return Column(
            children: [
              SearchBar(
                enabled: state is! GetInvoicesLoading,
                onChanged: (value) {
                  _debounce(() async {
                    setState(() {
                      invoices.clear();
                      isSearch = true;
                    });
                    await BlocProvider.of<GetInvoicesCubit>(context).getInvoices(
                      InvoiceFilterGenericFilterModel(
                        pageSize: 10,
                        pageNo: 1,
                        filter: InvoiceFilter(
                          freeText: searchController.text,
                          customerName: InvoicesLocalDataSource.customerName,
                          customerId: InvoicesLocalDataSource.customerId,
                          statusId: InvoicesLocalDataSource.status,
                          invoiceDateFrom: InvoicesLocalDataSource.invoiceDate,
                        ),
                      ),
                    );
                    setState(() {
                      pageNo = 2;
                    });
                  });
                },
                searchController: searchController,
                searchHintText: "search_for_invoices".tr(),
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
                          InvoicesLocalDataSource.status = null;
                          InvoicesLocalDataSource.customerName = null;
                          InvoicesLocalDataSource.customerId = null;
                          InvoicesLocalDataSource.invoiceDate = null;
                          invoices.clear();
                        });
                        await BlocProvider.of<GetInvoicesCubit>(context)
                            .getInvoices(InvoiceFilterGenericFilterModel(pageSize: 10, pageNo: 1));
                        setState(() {
                          pageNo = 2;
                        });
                        refreshController.refreshCompleted();
                      },
                      onLoading: () async {
                        setState(() {
                          isSearch = false;
                        });
                        await BlocProvider.of<GetInvoicesCubit>(context).getInvoices(
                          InvoiceFilterGenericFilterModel(
                            pageSize: 10,
                            pageNo: pageNo,
                            filter: InvoiceFilter(
                              freeText: searchController.text,
                              customerName: InvoicesLocalDataSource.customerName,
                              customerId: InvoicesLocalDataSource.customerId,
                              statusId: InvoicesLocalDataSource.status,
                              invoiceDateFrom: InvoicesLocalDataSource.invoiceDate,
                            ),
                          ),
                        );
                        setState(() {
                          pageNo++;
                        });
                        refreshController.loadComplete();
                      },
                      enablePullUp:
                          state.getInvoicesResponse?.result?.listMetadata.totalPages == pageNo - 1 ? false : true,
                      child: state is GetInvoicesLoading && pageNo - 1 == 1 && isSearch
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : invoices.isEmpty
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height / 1.5,
                                  child: EmptyScreen(
                                    title: "no_invoices".tr(),
                                    subtitle: "no_invoices_subtitle".tr(),
                                    imageString: ImageAssets.noInvoices,
                                  ),
                                )
                              : ListView.builder(
                                  physics: const ScrollPhysics(),
                                  itemCount: invoices.length,
                                  itemBuilder: (context, index) {
                                    return InvoiceListItem(
                                      key: UniqueKey(),
                                      invoice: invoices[index],
                                      onTap: () async {
                                        setState(() {
                                          tapped = true;
                                        });
                                        await BlocProvider.of<GetInvoicesCubit>(context)
                                            .getSingleInvoice(id: invoices[index].id);
                                      },
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
