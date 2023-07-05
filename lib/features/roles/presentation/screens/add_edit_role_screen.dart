import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
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
import '../../domain/entities/get_fetaures_result.dart';
import '../../domain/entities/get_single_role_result.dart';
import '../../domain/entities/role.dart';

class AddEditRoleScreen extends StatefulWidget {
  final int? roleId;

  const AddEditRoleScreen({Key? key, this.roleId}) : super(key: key);

  @override
  State<AddEditRoleScreen> createState() => _AddEditRoleScreenState();
}

class _AddEditRoleScreenState extends State<AddEditRoleScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = RolesCubit(sl(), sl(), sl());
  final addEditCubit = AddEditRoleCubit(sl(), sl());
  bool active = true;
  bool canEdit = true;
  bool canView = true;

  @override
  void initState() {
    cubit.getFeatures();
    cubit.getCompanyRoles(DiskRepo().loadCompanyId()??1);
    super.initState();
    if (widget.roleId != null) cubit.getSingleRole(id: widget.roleId!);
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.roleId != null;
    return BlocProvider<RolesCubit>.value(
      value: cubit,
      child: BlocConsumer<RolesCubit, RolesState>(
        listener: (context, state) async {
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
        },
        builder: (context, state) {
          return BlocProvider<AddEditRoleCubit>.value(
            value: addEditCubit,
            child: BlocConsumer<AddEditRoleCubit, AddEditRoleState>(
              listener: (context, addEditState) async {
                if (addEditState.addRoleRequestState == RequestState.success ||
                    addEditState.editRoleRequestState == RequestState.success) {
                  Navigator.of(context).pushAndRemoveUntil(
                    CustomPageRoute.createRoute(
                      page: const HomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
                if (addEditState.addRoleRequestState == RequestState.error) {
                  await getErrorDialogue(
                    context: context,
                    isUnAuthorized: state.getSingleRoleResponse!.statuscode == 401,
                    message: state.getSingleRoleResponse?.message?.first ?? "something_went_wrong".tr(),
                  );
                }

                if (addEditState.editRoleRequestState == RequestState.error) {
                  await getErrorDialogue(
                    context: context,
                    isUnAuthorized: state.getSingleRoleResponse!.statuscode == 401,
                    message: state.getSingleRoleResponse?.message?.first ?? "something_went_wrong".tr(),
                  );
                }
              },
              builder: (context, addEditState) {
                List<FeatureSingle> selectedFeatures = [];
                if (state.getSingleRoleResponse?.result?.features != null &&
                    state.getSingleRoleResponse!.result!.features.isNotEmpty &&
                    state.getSingleRoleResponse?.result?.companyRoleFeatures != null &&
                    state.getSingleRoleResponse!.result!.companyRoleFeatures.isNotEmpty)
                  for (var feature in state.getSingleRoleResponse!.result!.features) {
                    for (var companyFeature in state.getSingleRoleResponse!.result!.companyRoleFeatures) {
                      if (companyFeature.id == feature.id) {
                        selectedFeatures.add(feature);
                      }
                    }
                  }
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

                              final String description = formState.value["description"] as String;

                              List<FeatureSingle> featuresSingle = [];
                              List<FeatureModel> featuresModel = [];
                              List<CompanyRoleFeature> companyRoleFeature = [];
                              if (widget.roleId != null) {
                                featuresSingle = formState.value["features"] as List<FeatureSingle>;
                                for (var feature in state.getSingleRoleResponse!.result!.companyRoleFeatures) {
                                  for (var ff in featuresSingle)
                                    if (feature.id == ff.id) {
                                      companyRoleFeature.add(CompanyRoleFeature(id: feature.id, companyRoleId: feature.companyRoleId, featureId: feature.featureId));
                                    }
                                }
                              } else {
                                featuresModel = formState.value["features"] as List<FeatureModel>;
                                for (var feature in state.getFeaturesResponse!.result!) {
                                  for (var ff in featuresModel)
                                    if (feature.id == ff.id) {
                                      companyRoleFeature.add(CompanyRoleFeature(id: feature.id, companyRoleId: state.getRolesResponse!.result!.roles.first.companyid, featureId: feature.id));
                                    }
                                }
                              }

                              if (hasData) {
                                BlocProvider.of<AddEditRoleCubit>(context).editRole(
                                    id: widget.roleId ?? 0,
                                    role: Role(
                                      id: widget.roleId ?? 0,
                                      active: active,
                                      companyId: DiskRepo().loadCompanyId() ?? 0,
                                      roleName: name,
                                      canEdit: canEdit,
                                      canView: canView,
                                      roleDescription: description,
                                      features: [],
                                      companyRoleFeatures: companyRoleFeature,
                                    ));
                              } else {
                                BlocProvider.of<AddEditRoleCubit>(context).addRole(
                                    role: Role(
                                  id: 0,
                                  active: active,
                                  companyId: DiskRepo().loadCompanyId() ?? 0,
                                  roleName: name,
                                  canEdit: canEdit,
                                  canView: canView,
                                  features: [],
                                  roleDescription: description,
                                  companyRoleFeatures: companyRoleFeature,
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
                                                value: canEdit,
                                                onChanged: (value) {
                                                  setState(() {
                                                    canEdit = value;
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
                                                value: canView,
                                                onChanged: (value) {
                                                  setState(() {
                                                    canView = value;
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
                                  Container(
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 16.0),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: LWCustomText(
                                            title: "features".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                        ),
                                        widget.roleId != null
                                            ? Container(
                                                color: AppColors.whiteColor,
                                                child: LWCustomMultiSelectFormField<FeatureSingle>(
                                                  name: "features",
                                                  labelBuilder: (feature) {
                                                    return feature.name;
                                                  },
                                                  fillColor: Colors.white,
                                                  validator: [],
                                                  hintWidget: Container(),
                                                  initialValue: selectedFeatures,
                                                  items: state.getSingleRoleResponse?.result?.features ?? [],
                                                ),
                                              )
                                            : Container(
                                                color: AppColors.whiteColor,
                                                child: LWCustomMultiSelectFormField<FeatureModel>(
                                                  name: "features",
                                                  labelBuilder: (feature) {
                                                    return feature.name;
                                                  },
                                                  validator: [],
                                                  fillColor: Colors.white,
                                                  hintWidget: Container(),
                                                  items: state.getFeaturesResponse?.result ?? [],
                                                ),
                                              ),
                                      ],
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
              },
            ),
          );
        },
      ),
    );
  }
}
