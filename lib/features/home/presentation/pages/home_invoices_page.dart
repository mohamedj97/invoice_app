import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../invoices/domain/entities/invoice_head_model.dart';
import '../../../invoices/presentation/widgets/invoice_list_item.dart';

class HomeInvoicesPage extends StatefulWidget {
  const HomeInvoicesPage({Key? key}) : super(key: key);

  @override
  State<HomeInvoicesPage> createState() => _HomeInvoicesPageState();
}

class _HomeInvoicesPageState extends State<HomeInvoicesPage> {
  TextEditingController searchController = TextEditingController();
  List<InvoiceHeadModel> invoices = [];
  final cubit = GetInvoicesCubit(sl());

  @override
  void initState() {
    cubit.getInvoices();
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
          if (state.getInvoicesRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getInvoicesResponse!.statuscode == 401,
              message: state.getInvoicesResponse?.message ??
                  "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          invoices = state.getInvoicesResponse?.result?.result
                  .where((invoice) =>
                      invoice.id.toString().contains(searchController.text))
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
                      invoices =
                          state.getInvoicesResponse?.result?.result ?? [];
                    });
                  } else {
                    // searchDebouncer(() {
                    setState(() {
                      invoices = invoices
                          .where((invoice) => invoice.id
                              .toString()
                              .contains(searchController.text))
                          .toList();
                    });
                    // });
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
                        ? EmptyScreen(
                            title: "no_invoices".tr(),
                            subtitle: "no_invoices_subtitle".tr(),
                            imageString: ImageAssets.noInvoices,
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await BlocProvider.of<GetInvoicesCubit>(context)
                                  .getInvoices();
                              searchController.clear();
                            },
                            child: Container(
                              color: AppColors.scaffoldColor,
                              child: ListView.builder(
                                itemCount: invoices.length,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InvoiceListItem(
                                      invoice: invoices[index]);
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
