import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/create_invoice_screen.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../customers/presentation/screens/add_customer_screen.dart';

class ProfileCustomersScreen extends StatelessWidget {
  const ProfileCustomersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => sl<GetCustomersCubit>()..getCustomers(),
      child: BlocConsumer<GetCustomersCubit, GetCustomersState>(
        listener: (context, state) async {
          if (state.getCustomersRequestState == RequestState.success) {
            Navigator.of(context).push(CustomPageRoute.createRoute(
                page: const CreateEditInvoiceScreen()));
          }
          if (state.getCustomersRequestState == RequestState.error) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Icon(
                    Icons.warning,
                    color: AppColors.primary,
                    size: 80.0,
                  ),
                  content: Text(state.failure ?? "something_went_wrong".tr()),
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
          return CustomScaffold(
            title: "customers".tr(),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(CustomPageRoute.createRoute(
                      page: const AddCustomerScreen()));
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
            body: Column(
              children: [
                SearchBar(
                  searchController: searchController,
                  searchHintText: "search_for_customers".tr(),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Container(
                    color: AppColors.scaffoldColor,
                    child: ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        CustomerModel? item =
                            state.getCustomersResponse?.result?.result[index];
                        if (index != 3 - 1) {
                          return InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   CustomPageRoute.createRoute(
                              //     page: AddCustomerScreen(
                              //         customerItem: customers[index]),
                              //   ),
                              // );
                            },
                            child: Container(
                              width: double.infinity,
                              color: AppColors.whiteColor,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 24.0, left: 8.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LWCustomText(
                                        title: item?.name ?? "NA",
                                        color: AppColors.labelColor,
                                        fontSize: 18.0,
                                        fontFamily: FontAssets.avertaRegular,
                                      ),
                                      const SizedBox(height: 24.0),
                                      const Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 8.0, bottom: 24.0),
                              child: LWCustomText(
                                title: item?.name ?? "NA",
                                color: AppColors.labelColor,
                                fontSize: 18.0,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
