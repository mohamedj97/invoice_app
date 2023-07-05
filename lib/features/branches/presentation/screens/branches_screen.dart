import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/utils/string_validation_extension.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:invoice_app/features/branches/presentation/cubit/branches_cubit.dart';
import 'package:invoice_app/features/branches/presentation/screens/add_edit_branch_screen.dart';
import '../../../../core/api/repository/disk_repo.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/empty_screen.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/common_widgets/search_bar.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  TextEditingController searchController = TextEditingController();
  List<CompanyBranch> branches = [];
  final cubit = BranchesCubit(sl());

  @override
  void initState() {
    cubit.getCompanyBranches(DiskRepo().loadCompanyId()??1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<BranchesCubit, BranchesState>(
        listener: (context, state) async {
          if (state.getBranchesRequestState == RequestState.success) {
            // Navigator.of(context).push(CustomPageRoute.createRoute(
            //     page: const CreateEditInvoiceScreen()));
          }
          if (state.getBranchesRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getBranchesResponse!.statuscode == 401,
              message: state.getBranchesResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          branches = state.getBranchesResponse?.result?.branches
                  .where((branch) => branch.name!.toLowerCase().contains(searchController.text))
                  .toList() ??
              state.getBranchesResponse?.result?.branches ??
              [];
          return CustomScaffold(
            title: "branches".tr(),
            leading: const CustomBackButton(),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(CustomPageRoute.createRoute(page: const AddEditBranchScreen()));
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
                  enabled: state is! BranchesLoading,
                  onChanged: (value) {
                    if (value.isEmptyOrNull) {
                      setState(() {
                        branches = state.getBranchesResponse?.result?.branches ?? [];
                      });
                    } else {
                      setState(() {
                        branches =
                            branches.where((user) => user.name!.toLowerCase().contains(searchController.text)).toList();
                      });
                    }
                  },
                  searchController: searchController,
                  searchHintText: "search_for_branches".tr(),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: state is BranchesLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : branches.isEmpty
                          ? RefreshIndicator(
                              onRefresh: () async {
                                await BlocProvider.of<BranchesCubit>(context).getCompanyBranches(DiskRepo().loadCompanyId()??1);
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
                                  await BlocProvider.of<BranchesCubit>(context).getCompanyBranches(DiskRepo().loadCompanyId()??1);
                                  searchController.clear();
                                },
                                child: ListView.builder(
                                  itemCount: branches.length,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    CompanyBranch? item = branches[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            CustomPageRoute.createRoute(
                                              page: AddEditBranchScreen(branchItem: item),
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
