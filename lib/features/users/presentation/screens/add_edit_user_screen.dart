import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import 'package:invoice_app/features/roles/presentation/cubit/roles_cubit.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import 'package:invoice_app/features/users/presentation/cubit/add_edit_user_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../injection_container.dart';
import '../../../branches/domain/entities/company_branch.dart';
import '../../../branches/presentation/cubit/branches_cubit.dart';
import '../../../roles/domain/entities/company_role.dart';
import '../../domain/entities/company_user.dart';

class AddEditUserScreen extends StatefulWidget {
  final CompanyUser? companyUser;

  const AddEditUserScreen({Key? key, this.companyUser}) : super(key: key);

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = AddEditUserCubit(sl(), sl());
  final roleCubit = RolesCubit(sl(), sl(), sl());
  final branchCubit = BranchesCubit(sl());
  bool active = true;
  List<CompanyRole> roles = [];
  List<CompanyBranch> branches = [];

  @override
  void initState() {
    roleCubit.getCompanyRoles();
    branchCubit.getCompanyBranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.companyUser != null;
    return BlocProvider<BranchesCubit>.value(
      value: branchCubit,
      child: BlocConsumer<BranchesCubit, BranchesState>(
        listener: (context, branchState) async {
          if (branchState.getBranchesRequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: branchState.getBranchesResponse!.statuscode == 401,
              message: branchState.getBranchesResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, branchState) {
          branches = branchState.getBranchesResponse?.result?.branches ?? [];
          return BlocProvider<RolesCubit>.value(
            value: roleCubit,
            child: BlocConsumer<RolesCubit, RolesState>(
              listener: (context, rolesState) async {
                if (rolesState.getRolesRequestState == RequestState.error) {
                  await getErrorDialogue(
                    context: context,
                    isUnAuthorized: rolesState.getRolesResponse!.statuscode == 401,
                    message: rolesState.getRolesResponse?.message?.first ?? "something_went_wrong".tr(),
                  );
                }
              },
              builder: (context, rolesState) {
                roles = rolesState.getRolesResponse?.result?.roles ?? [];
                return BlocProvider<AddEditUserCubit>.value(
                  value: cubit,
                  child: BlocConsumer<AddEditUserCubit, AddEditUserState>(
                    listener: (context, addEditState) async {
                      if (addEditState.editUserRequestState == RequestState.success ||
                          addEditState.addUserRequestState == RequestState.success) {
                        Navigator.of(context).pushAndRemoveUntil(
                          CustomPageRoute.createRoute(
                            page: const HomeScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                      if (addEditState.editUserRequestState == RequestState.error) {
                        await getErrorDialogue(
                          context: context,
                          isUnAuthorized: addEditState.boolResponse!.statuscode == 401,
                          message: addEditState.boolResponse?.message?.first ?? "something_went_wrong".tr(),
                        );
                      }

                      if (addEditState.addUserRequestState == RequestState.error) {
                        await getErrorDialogue(
                          context: context,
                          isUnAuthorized: addEditState.getSingleUserResponse!.statuscode == 401,
                          message: addEditState.getSingleUserResponse?.message?.first ?? "something_went_wrong".tr(),
                        );
                      }
                    },
                    builder: (context, addEditState) {
                      if (hasData) active = widget.companyUser?.active ?? true;
                      return CustomScaffold(
                        title: hasData ? "edit_user".tr() : "add_user".tr(),
                        leading: const CustomBackButton(),
                        actions: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                  onTap: () async {
                                    var formState = formKey.currentState;
                                    if (formState == null) return;
                                    if (!formState.saveAndValidate()) {
                                      return;
                                    }
                                    final String userName = formState.value["name"] as String;
                                    final String fullName = formState.value["full_name"] as String;
                                    final String password = formState.value["password"] as String;
                                    final String email = formState.value["email"] as String;
                                    final CompanyRole role = formState.value["role"] as CompanyRole;
                                    final CompanyBranch branch = formState.value["branch"] as CompanyBranch;

                                    if (hasData) {
                                      await BlocProvider.of<AddEditUserCubit>(context).editUser(
                                          id: widget.companyUser?.userid ?? 1,
                                          userRequest: UserRequest(
                                            id: widget.companyUser?.userid ?? 1,
                                            active: active,
                                            companyId: DiskRepo().loadCompanyId() ?? 1,
                                            roleId: role.id,
                                            branchId: branch.id,
                                            email: email,
                                            password: password,
                                            username: userName,
                                            fullname: fullName,
                                          ));
                                    } else {
                                      await BlocProvider.of<AddEditUserCubit>(context).addUser(
                                          userRequest: UserRequest(
                                        id: 0,
                                        active: active,
                                        companyId: DiskRepo().loadCompanyId() ?? 1,
                                        roleId: role.id,
                                        branchId: branch.id,
                                        email: email,
                                        password: password,
                                        username: userName,
                                        fullname: fullName,
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
                        body: addEditState is AddEditUserLoading
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
                                              title: "contact_information".tr(),
                                              color: AppColors.disabledBottomItemColor),
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
                                                  initialValue: hasData ? widget.companyUser?.username ?? "" : null,
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
                                                    title: "full_name".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "full_name",
                                                  showLabel: false,
                                                  labelText: "",
                                                  hintText: "full_name".tr(),
                                                  isRequired: true,
                                                  initialValue: hasData ? widget.companyUser?.fullname ?? "" : null,
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
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: LWCustomText(
                                                    title: "email".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "email",
                                                  showLabel: false,
                                                  labelText: "",
                                                  hintText: "email".tr(),
                                                  isRequired: true,
                                                  initialValue: hasData ? widget.companyUser?.email ?? "" : null,
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
                                                    title: "password".tr(),
                                                    color: AppColors.labelColor,
                                                    fontFamily: FontAssets.avertaRegular,
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                LWCustomTextFormField(
                                                  name: "password",
                                                  showLabel: false,
                                                  labelText: "",
                                                  hintText: "password".tr(),
                                                  isRequired: true,
                                                  initialValue: hasData ? widget.companyUser?.password ?? "" : null,
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
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: LWCustomText(
                                              title: "information".tr(), color: AppColors.disabledBottomItemColor),
                                        ),
                                        const SizedBox(height: 16.0),
                                        branchState is BranchesLoading
                                            ? const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: CircularProgressIndicator(),
                                                ),
                                              )
                                            : Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(height: 16.0),
                                                      LWCustomText(
                                                        title: "role".tr(),
                                                        color: AppColors.labelColor,
                                                        fontFamily: FontAssets.avertaRegular,
                                                      ),
                                                      const SizedBox(height: 8.0),
                                                      LWCustomDropdownFormField<CompanyRole>(
                                                        name: "role",
                                                        iconColor: AppColors.labelColor,
                                                        showLabel: true,
                                                        labelText: "".tr(),
                                                        hintText: "role".tr(),
                                                        isRequired: true,
                                                        initialValue: widget.companyUser?.roleId != null
                                                            ? roles.firstWhere(
                                                                (element) => element.id == widget.companyUser?.roleId)
                                                            : null,
                                                        isCard: false,
                                                        showRequiredSymbol: false,
                                                        border: const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                                        ),
                                                        items: roles,
                                                        itemBuilder: (context, data) {
                                                          return Column(
                                                            children: [
                                                              Text(data.name ?? ""),
                                                              const Divider(color: AppColors.primary),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        const SizedBox(height: 16.0),
                                        rolesState is RolesLoading
                                            ? const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: CircularProgressIndicator(),
                                                ),
                                              )
                                            : Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(height: 16.0),
                                                      LWCustomText(
                                                        title: "branch".tr(),
                                                        color: AppColors.labelColor,
                                                        fontFamily: FontAssets.avertaRegular,
                                                      ),
                                                      const SizedBox(height: 8.0),
                                                      LWCustomDropdownFormField<CompanyBranch>(
                                                        name: "branch",
                                                        iconColor: AppColors.labelColor,
                                                        showLabel: true,
                                                        labelText: "".tr(),
                                                        hintText: "branch".tr(),
                                                        initialValue: widget.companyUser?.branchid != null
                                                            ? branches.firstWhere(
                                                                (element) => element.id == widget.companyUser?.branchid)
                                                            : null,
                                                        isRequired: true,
                                                        isCard: false,
                                                        showRequiredSymbol: false,
                                                        border: const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(color: AppColors.searchBarColor, width: 1.0),
                                                        ),
                                                        items: branches,
                                                        itemBuilder: (context, data) {
                                                          return Column(
                                                            children: [
                                                              Text(data.name ?? ""),
                                                              const Divider(color: AppColors.primary),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
        },
      ),
    );
  }
}
