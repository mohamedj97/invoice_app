import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import 'package:invoice_app/features/roles/presentation/cubit/add_edit_role_cubit.dart';
import 'package:invoice_app/features/roles/presentation/cubit/roles_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_multi_select_form_field.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/role.dart';

class AddEditRoleScreen extends StatefulWidget {
  final int? roleId;

  const AddEditRoleScreen({Key? key, this.roleId}) : super(key: key);

  @override
  State<AddEditRoleScreen> createState() => _AddEditRoleScreenState();
}

class _AddEditRoleScreenState extends State<AddEditRoleScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = RolesCubit(sl(), sl(),sl());
  final addEditCubit = AddEditRoleCubit(sl(), sl());
  bool active = false;

  @override
  void initState() {
    super.initState();
    if (widget.roleId != null) cubit.getSingleRole(id: widget.roleId!);
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.roleId != null;
    return BlocProvider<RolesCubit>.value(
      value: cubit,
      child: BlocConsumer<RolesCubit, RolesState>(listener: (context, state) async {
        if (state.getSingleRoleRequestState == RequestState.success) {
          Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute.createRoute(
              page: const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state.getSingleRoleRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.getSingleRoleResponse!.statuscode == 401,
            message: state.getSingleRoleResponse?.message?.first ?? "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
        return CustomScaffold(
          title: hasData ? "edit_role".tr() : "add_role".tr(),
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
                        // BlocProvider.of<AddEditRoleCubit>(context).editRole(
                        //     id: 1,
                        //     role: Role(
                        //       id: 0,
                        //       active: true,
                        //       companyId: 0,
                        //       name: name,
                        //       address2: address2,
                        //       address: address1,
                        //     ));
                      } else {
                        // BlocProvider.of<AddEditRoleCubit>(context).addRole(
                        //     role: Role(
                        //   id: 0,
                        //   active: true,
                        //   companyId: 0,
                        //   name: name,
                        //   address2: address2,
                        //   address: address1,
                        // ));
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
          body: state is RolesLoading
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
                                      title: "role_name".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "name",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "role_name".tr(),
                                    isRequired: true,
                                    //initialValue: hasData ? widget.branchItem!.name : null,
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
                                      title: "description".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "description",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "description".tr(),
                                    isRequired: true,
                                    //initialValue: hasData ? widget.branchItem!.name : null,
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
                                            title: "can_edit".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        activeColor: AppColors.primary,
                                        value: active,
                                        onChanged: (value) {
                                          setState(() {
                                            active = value;
                                          });
                                        },
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
                                            title: "can_view".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        activeColor: AppColors.primary,
                                        value: active,
                                        onChanged: (value) {
                                          setState(() {
                                            active = value;
                                          });
                                        },
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
                            child: LWCustomMultiSelectFormField<Feature>(
                              name: "features",
                              labelBuilder: (feature) {
                                return feature.name;
                              },
                              validator: [],
                              hintWidget: Container(),
                              items:state.getSingleRoleResponse?.result?.role.features ??[],
                            ),
                          ),
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
                                            title: "active".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      CupertinoSwitch(
                                        activeColor: AppColors.primary,
                                        value: active,
                                        onChanged: (value) {
                                          setState(() {
                                            active = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  const Divider(
                                    thickness: 0.5,
                                    height: 0.0,
                                    color: AppColors.searchBarColor,
                                  ),
                                ],
                              ),
                            ),
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
