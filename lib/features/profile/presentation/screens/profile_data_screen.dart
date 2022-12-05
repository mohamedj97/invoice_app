import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/profile/domain/entities/user_info_data.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/profile_data_form_item.dart';

class ProfileDataScreen extends StatefulWidget {
  final UserInfoData user;
  const ProfileDataScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                    color: AppColors.primary,fontFamily: FontAssets.avertaSemiBold,fontWeight: FontWeight.bold,)),
          ),
        ),
      ],
      title: "profile_data".tr(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              ProfileDataFormItem(
                hintText: "Hazem",
                label: "full_name".tr(),
                name: "full_name",
                isRequired:true,
                initialValue: widget.user.userName,
              ),
              const SizedBox(height: 24.0),
              // ProfileDataFormItem(
              //   hintText: "+201234567890",
              //   label: "phone_number".tr(),
              //   name: "phone_number",
              //   keyboardType: const TextInputType.numberWithOptions(),
              //   controller: phoneController,
              //   isRequired:true,
              // ),
              // const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText: "example@email.com",
                label: "email".tr(),
                name: "email",
                initialValue: widget.user.email,
              ),
              // const SizedBox(height: 24.0),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ProfileDataFormItem(
              //         hintText: "Egypt",
              //         label: "country".tr(),
              //         name: "Country",
              //       ),
              //     ),
              //     const SizedBox(width: 3.0),
              //     Expanded(
              //       child: ProfileDataFormItem(
              //         hintText: "New Cairo",
              //         label: "city".tr(),
              //         name: "city",
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
