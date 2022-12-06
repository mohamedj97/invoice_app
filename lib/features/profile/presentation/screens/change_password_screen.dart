import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_password_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_repeat_password_form_field.dart';
import 'package:invoice_app/features/profile/domain/entities/change_password_request.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../cubit/change_paswword_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String? userName;

  const ChangePasswordScreen({Key? key, this.userName}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>.value(
      value: ChangePasswordCubit(sl()),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) async {
          if (state.changePasswordRequestState == RequestState.success) {
            getErrorDialogue(
              context: context,
              onPressed: (){
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute.createRoute(
                    page: const HomeScreen(),
                  ),
                      (Route<dynamic> route) => false,
                );
              },
              isUnAuthorized: state.stringResponse!.statuscode == 401,
              message:
              state.stringResponse?.result ?? "password_change_success".tr(),
            );
          }
          if (state.changePasswordRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.stringResponse!.statuscode==401,
              message: state.stringResponse?.message ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            backGroundColor: AppColors.whiteColor,
            leading: const CustomBackButton(),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                      onTap: state is ChangePasswordLoading
                          ? null
                          : () {
                              var formState = formKey.currentState;
                              if (formState == null) return;
                              if (!formState.saveAndValidate()) {
                                return;
                              }
                                  BlocProvider.of<ChangePasswordCubit>(context)
                                      .changePassword(
                                ChangePasswordRequest(
                                    widget.userName ?? "",
                                    formState.value["current_password"],
                                    formState.value["new_password"],
                                    formState.value["confirm_password"]),
                              );
                              // if (state.stringResponse!.message!.isNotEmpty && state.stringResponse!.message !=null) {
                              //   getErrorDialogue(
                              //     context: context,
                              //     isUnAuthorized:
                              //         state.stringResponse!.statuscode == 401,
                              //     message: state.stringResponse?.message ??
                              //         "something_went_wrong".tr(),
                              //   );
                              // } else {
                              //   getErrorDialogue(
                              //     context: context,
                              //     isUnAuthorized:
                              //         state.stringResponse!.statuscode == 401,
                              //     message: state.stringResponse?.message ??
                              //         "password_change_success".tr(),
                              //   );
                              // }
                            },
                      child: LWCustomText(
                        title: "save".tr(),
                        color: AppColors.primary,
                        fontFamily: FontAssets.avertaSemiBold,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
            title: "password".tr(),
            body: state is ChangePasswordLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.blackColor,
                                  width: 0.25,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LWCustomText(
                                    title: "current_password".tr(),
                                    color: AppColors.labelColor,
                                    fontSize: 14.0,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  LWCustomPasswordFormField(
                                    controller: currentPasswordController,
                                    isRequired: true,
                                    labelText: "",
                                    showLabel: false,
                                    name: 'current_password',
                                    showRequiredSymbol: false,
                                    hintText: "**********",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.blackColor,
                                  width: 0.25,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LWCustomText(
                                    title: "new_password".tr(),
                                    color: AppColors.labelColor,
                                    fontSize: 14.0,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  LWCustomPasswordFormField(
                                    controller: newPasswordController,
                                    isRequired: true,
                                    labelText: "",
                                    showLabel: false,
                                    name: 'new_password',
                                    showRequiredSymbol: false,
                                    hintText: "**********",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.blackColor,
                                  width: 0.25,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LWCustomText(
                                    title: "confirm_password".tr(),
                                    color: AppColors.labelColor,
                                    fontSize: 14.0,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  LWCustomRepeatPasswordFormField(
                                    isRequired: true,
                                    labelText: "",
                                    showLabel: false,
                                    name: 'confirm_password',
                                    showRequiredSymbol: false,
                                    isCard: false,
                                    hintText: "**********",
                                    passwordController: newPasswordController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.blackColor,
                                  width: 0.25,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LWCustomText(
                                    title: "user_name".tr(),
                                    color: AppColors.labelColor,
                                    fontSize: 14.0,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LWCustomText(
                                        title:
                                            widget.userName ?? "user_name".tr(),
                                        color: AppColors.searchBarColor,
                                      ),
                                      const Icon(Icons.mode_edit_sharp,
                                          color: AppColors.searchBarColor)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
