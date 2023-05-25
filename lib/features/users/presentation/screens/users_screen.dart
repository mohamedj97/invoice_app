import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/users/presentation/cubit/users_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../customers/presentation/screens/add_customer_screen.dart';
import '../../domain/entities/company_user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  TextEditingController searchController = TextEditingController();
  List<CompanyUser> users = [];
  final cubit = UsersCubit(sl(), sl());

  @override
  void initState() {
    cubit.getCompanyUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) async {
          if (state.getUsersRequestState == RequestState.success) {
            // Navigator.of(context).push(CustomPageRoute.createRoute(
            //     page: const CreateEditInvoiceScreen()));
          }
          if (state.getUsersRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getUsersResponse!.statuscode == 401,
              message: state.getUsersResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          users = state.getUsersResponse?.result?.users
                  .where((user) => user.username!.toLowerCase().contains(searchController.text))
                  .toList() ??
              state.getUsersResponse?.result?.users ??
              [];
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
                  enabled: state is! UsersLoading,
                  onChanged: (value) {
                    if (value.isEmptyOrNull) {
                      setState(() {
                        users = state.getUsersResponse?.result?.users ?? [];
                      });
                    } else {
                      //searchDebouncer(() {
                      setState(() {
                        users = users
                            .where((user) => user.username!.toLowerCase().contains(searchController.text))
                            .toList();
                      });
                      // });
                    }
                  },
                  searchController: searchController,
                  searchHintText: "search_for_users".tr(),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: state is UsersLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : users.isEmpty
                          ? RefreshIndicator(
                              onRefresh: () async {
                                await BlocProvider.of<UsersCubit>(context).getCompanyUsers();
                                searchController.clear();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height / 1.5,
                                  child: EmptyScreen(
                                    title: "no_customers".tr(),
                                    subtitle: "no_customers_subtitle".tr(),
                                    imageString: ImageAssets.noCustomers,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: AppColors.scaffoldColor,
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await BlocProvider.of<UsersCubit>(context).getCompanyUsers();
                                  searchController.clear();
                                },
                                child: ListView.builder(
                                  itemCount: users.length,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    CompanyUser? item = users[index];
                                    if (index != users.length - 1) {
                                      return InkWell(
                                        onTap: () {
                                          // Navigator.of(context).push(
                                          //   CustomPageRoute.createRoute(
                                          //     page: AddEditCustomerScreen(customerItem: item),
                                          //   ),
                                          // );
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
                                                    title: item.username ?? "NA",
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
                                            title: item.username!,
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
