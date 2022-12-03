import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/utils/debouncer.dart';
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
  final searchDebouncer = Debouncer();
  final cubit = GetInvoicesCubit(sl());
  List<InvoiceHeadModel> invoices = [];

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() async{
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetInvoicesCubit>(
      create: (context) => sl<GetInvoicesCubit>()..getInvoices(),
      child: BlocConsumer<GetInvoicesCubit, GetInvoicesState>(
        listener: (context, state) async {
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
                  content: Text(state.getInvoicesResponse?.message ??
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
                    //searchDebouncer(() {
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
