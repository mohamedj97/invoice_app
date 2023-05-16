import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customers/get_customers_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../customers/data/models/requests/get_customers_request_model.dart';
import '../../../customers/domain/entities/customer_filter.dart';
import '../../../customers/domain/entities/customers_model.dart';
import '../../../customers/presentation/screens/add_customer_screen.dart';
import '../cubit/users_cubit.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  TextEditingController searchController = TextEditingController();
  List<CustomersModel> customers = [];
  final cubit = UsersCubit(sl());
  int pageNo = 2;
  bool isSearch = true;
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    cubit.getCompanyUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<GetCustomersCubit, GetCustomersState>(
        listener: (context, state) async {
          if (state.getCustomersRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getCustomersResponse!.statuscode == 401,
              message: state.getCustomersResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          customers.addAll(state.getCustomersResponse?.result?.customers ?? []);
          return CustomScaffold(
            title: "users".tr(),
            leading: const CustomBackButton(),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(CustomPageRoute.createRoute(page: const AddEditCustomerScreen()));
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
                  onChanged: (value) async {
                    _debounce(() async {
                      setState(() {
                        customers.clear();
                        isSearch = true;
                      });
                      await BlocProvider.of<GetCustomersCubit>(context).getCustomers(
                        CustomerFilterGenericFilterModel(
                          pageSize: 10,
                          pageNo: 1,
                          filter: CustomerFilter(
                            customerName: searchController.text,
                          ),
                        ),
                      );
                      setState(() {
                        pageNo = 2;
                      });
                    });
                  },
                  searchController: searchController,
                  searchHintText: "search_for_users".tr(),
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
                            customers.clear();
                          });
                          await BlocProvider.of<GetCustomersCubit>(context)
                              .getCustomers(CustomerFilterGenericFilterModel(pageSize: 10, pageNo: 1));
                          setState(() {
                            pageNo = 2;
                          });
                          refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          setState(() {
                            isSearch = false;
                          });
                          await BlocProvider.of<GetCustomersCubit>(context).getCustomers(
                            CustomerFilterGenericFilterModel(
                              pageSize: 10,
                              pageNo: pageNo,
                              filter: CustomerFilter(
                                customerName: searchController.text,
                              ),
                            ),
                          );
                          setState(() {
                            pageNo++;
                          });
                          refreshController.loadComplete();
                        },
                        enablePullUp:
                        state.getCustomersResponse?.result?.listMetadata.totalPages == pageNo - 1 ? false : true,
                        child: state is GetCustomersLoading && pageNo - 1 == 1 && isSearch
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : customers.isEmpty
                            ? SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: EmptyScreen(
                            title: "no_customers".tr(),
                            subtitle: "no_customers_subtitle".tr(),
                            imageString: ImageAssets.noCustomers,
                          ),
                        )
                            : ListView.builder(
                          itemCount: customers.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            CustomersModel? item = customers[index];
                            if (index != customers.length - 1) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CustomPageRoute.createRoute(
                                      page: AddEditCustomerScreen(customerItem: item),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 24.0, left: 8.0),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          LWCustomText(
                                            title: item.name ?? "NA",
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
                                  padding: const EdgeInsets.only(top: 24.0, left: 8.0, bottom: 24.0),
                                  child: LWCustomText(
                                    title: item.name!,
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
