import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_password_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_repeat_password_form_field.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
    return CustomScaffold(
      backGroundColor: AppColors.whiteColor,
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
                  Navigator.of(context).push(
                      CustomPageRoute.createRoute(page: const HomeScreen()));
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
      body: Padding(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                           LWCustomText(
                            title: "hazim-hassan123",
                            color: AppColors.searchBarColor,
                          ),
                          Icon(Icons.mode_edit_sharp,color: AppColors.searchBarColor)
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
  }
}
