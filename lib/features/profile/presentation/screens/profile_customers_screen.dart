import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../customers/presentation/screens/add_customer_screen.dart';

class ProfileCustomersScreen extends StatefulWidget {
  const ProfileCustomersScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCustomersScreen> createState() => _ProfileCustomersScreenState();
}

class _ProfileCustomersScreenState extends State<ProfileCustomersScreen> {
  TextEditingController searchController = TextEditingController();
  List<CustomerModel> customers = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCustomersCubit>()..getCustomers(),
      child: BlocConsumer<GetCustomersCubit, GetCustomersState>(
        listener: (context, state) async {
          if (state.getCustomersRequestState == RequestState.success) {
            // Navigator.of(context).push(CustomPageRoute.createRoute(
            //     page: const CreateEditInvoiceScreen()));
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
          customers = state.getCustomersResponse?.result?.result
                  .where((customer) => customer.name!
                      .toLowerCase()
                      .contains(searchController.text))
                  .toList() ??
              state.getCustomersResponse?.result?.result ??
              [];
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
                  enabled: state is! GetCustomersLoading,
                  onChanged: (value) {
                    if (value.isEmptyOrNull) {
                      setState(() {
                        customers =
                            state.getCustomersResponse?.result?.result ?? [];
                      });
                    } else {
                      //searchDebouncer(() {
                      setState(() {
                        customers = customers
                            .where((customer) => customer.name!
                                .toLowerCase()
                                .contains(searchController.text))
                            .toList();
                      });
                      // });
                    }
                  },
                  searchController: searchController,
                  searchHintText: "search_for_customers".tr(),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: state is GetCustomersLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : customers.isEmpty
                          ? EmptyScreen(
                              title: "no_customers".tr(),
                              subtitle: "no_customers_subtitle".tr(),
                              imageString: ImageAssets.noCustomers,
                            )
                          : Container(
                              color: AppColors.scaffoldColor,
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await BlocProvider.of<GetCustomersCubit>(
                                          context)
                                      .getCustomers();
                                  searchController.clear();
                                },
                                child: ListView.builder(
                                  itemCount: customers.length,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    CustomerModel? item = customers[index];
                                    if (index != customers.length - 1) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            CustomPageRoute.createRoute(
                                              page: AddCustomerScreen(
                                                  customerItem: item),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: AppColors.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 24.0, left: 8.0),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  LWCustomText(
                                                    title: item.name ?? "NA",
                                                    color: AppColors.labelColor,
                                                    fontSize: 18.0,
                                                    fontFamily: FontAssets
                                                        .avertaRegular,
                                                  ),
                                                  const SizedBox(height: 24.0),
                                                  const Divider(
                                                    thickness: 0.5,
                                                    height: 0.0,
                                                    color: AppColors
                                                        .searchBarColor,
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
                                              top: 24.0,
                                              left: 8.0,
                                              bottom: 24.0),
                                          child: LWCustomText(
                                            title: item.name ?? "NA",
                                            color: AppColors.labelColor,
                                            fontSize: 18.0,
                                            fontFamily:
                                                FontAssets.avertaRegular,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
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
