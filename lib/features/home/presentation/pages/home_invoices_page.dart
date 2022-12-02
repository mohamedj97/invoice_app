import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_invoices/get_invoices_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../invoices/presentation/widgets/invoice_list_item.dart';

class HomeInvoicesPage extends StatelessWidget {
  const HomeInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return RefreshIndicator(
      onRefresh: () async {},
      child: BlocProvider<GetInvoicesCubit>(
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
            return Column(
              children: [
                SearchBar(
                  searchController: searchController,
                  searchHintText: "search_for_invoices".tr(),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: state is GetInvoicesLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          color: AppColors.scaffoldColor,
                          child: ListView.builder(
                            itemCount: state.getInvoicesResponse?.result?.result
                                    .length ??
                                0,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InvoiceListItem(
                                  invoice: state.getInvoicesResponse!.result!
                                      .result[index]);
                            },
                          ),
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
