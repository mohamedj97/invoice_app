import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/branches/presentation/cubit/add_edit_branch_cubit.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import '../../../../core/api/repository/disk_repo.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/company_branch.dart';

class AddEditBranchScreen extends StatefulWidget {
  final CompanyBranch? branchItem;

  const AddEditBranchScreen({Key? key, this.branchItem}) : super(key: key);

  @override
  State<AddEditBranchScreen> createState() => _AddEditBranchScreenState();
}

class _AddEditBranchScreenState extends State<AddEditBranchScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = AddEditBranchCubit(sl(), sl());
  bool active = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.branchItem != null;
    return BlocProvider<AddEditBranchCubit>.value(
      value: cubit,
      child: BlocConsumer<AddEditBranchCubit, AddEditBranchState>(listener: (context, state) async {
        if (state.addBranchRequestState == RequestState.success ||
            state.editBranchRequestState == RequestState.success) {
          Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute.createRoute(
              page: const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state.addBranchRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.addBranchResponse!.statuscode == 401,
            message: state.addBranchResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }

        if (state.editBranchRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.boolResponse!.statuscode == 401,
            message: state.boolResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        return CustomScaffold(
          title: hasData ? "edit_branch".tr() : "add_branch".tr(),
          leading: const CustomBackButton(),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                    onTap: () {
                      var formState = formKey.currentState;
                      if (formState == null) return;
                      if (!formState.saveAndValidate()) {
                        return;
                      }
                      final String name = formState.value["name"] as String;

                      final String address1 = formState.value["address_1"] as String;

                      final String address2 = formState.value["address_2"] as String;

                      if (hasData) {
                        BlocProvider.of<AddEditBranchCubit>(context).editBranch(
                            id: widget.branchItem?.id ?? 1,
                            companyBranch: CompanyBranch(
                              id: widget.branchItem?.id ?? 1,
                              active: active,
                              companyId: widget.branchItem?.companyId ?? DiskRepo().loadCompanyId() ?? 1,
                              name: name,
                              code: "12345",
                              address2: address2,
                              address: address1,
                            ));
                      } else {
                        BlocProvider.of<AddEditBranchCubit>(context).addBranch(
                            companyBranch: CompanyBranch(
                          id: 0,
                          active: active,
                          companyId: DiskRepo().loadCompanyId() ?? 1,
                          name: name,
                          code: "12345",
                          address2: address2,
                          address: address1,
                        ));
                      }
                    },
                    child: LWCustomText(
                      title: hasData ? "save".tr() : "done".tr(),
                      color: AppColors.primary,
                      fontFamily: FontAssets.avertaSemiBold,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
          body: state is AddEditBranchLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: LWCustomText(
                                title: "contact_information".tr(), color: AppColors.disabledBottomItemColor),
                          ),
                          const SizedBox(height: 16.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              thickness: 0.5,
                              height: 0.0,
                              color: AppColors.searchBarColor,
                            ),
                          ),
                          Container(
                            color: AppColors.whiteColor,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "user_name".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "name",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "user_name".tr(),
                                    isRequired: true,
                                    initialValue: hasData ? widget.branchItem!.name : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                            height: 0.0,
                            color: AppColors.searchBarColor,
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 13),
                                          child: LWCustomText(
                                            title: "code".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: LWCustomTextFormField(
                                            textAlign: TextAlign.end,
                                            name: "code",
                                            showLabel: false,
                                            enabled: false,
                                            labelText: "",
                                            hintText: "#123456",
                                            isRequired: false,
                                            initialValue: hasData ? "${widget.branchItem!.code}" : null,
                                            isCard: false,
                                            maxLines: 5,
                                            keyboardType: const TextInputType.numberWithOptions(),
                                            borderDecoration: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.0,
                                      color: AppColors.searchBarColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: LWCustomText(
                                title: "address_information".tr(), color: AppColors.disabledBottomItemColor),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            color: AppColors.whiteColor,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "address_1".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "address_1",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "address_1".tr(),
                                    isRequired: true,
                                    initialValue: hasData ? widget.branchItem!.address : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.0,
                                      color: AppColors.searchBarColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.whiteColor,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "address_2".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "address_2",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "address_2".tr(),
                                    isRequired: false,
                                    initialValue: hasData ? widget.branchItem!.address2 : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                            height: 0.0,
                            color: AppColors.searchBarColor,
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  LWCustomText(
                                    title: "active".tr(),
                                    color: AppColors.labelColor,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  CupertinoSwitch(
                                    activeColor: AppColors.primary,
                                    value: widget.branchItem?.active ?? active,
                                    onChanged: (value) {
                                      setState(() {
                                        active = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
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
      }),
    );
  }
}
