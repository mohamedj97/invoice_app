import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/profile_data_form_item.dart';

class ProfileDataScreen extends StatefulWidget {
  const ProfileDataScreen({Key? key}) : super(key: key);

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
                child: const LWCustomText(
                    title: "Save",
                    color: AppColors.primary,fontFamily: FontAssets.avertaSemiBold,fontWeight: FontWeight.bold,)),
          ),
        ),
      ],
      title: "profile data",
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ProfileDataFormItem(
                      hintText: "Hazem",
                      label: "First name",
                      name: "first_name",
                      isRequired:true,
                      controller: firstNameController,
                    ),
                  ),
                  const SizedBox(width: 3.0),
                  Expanded(
                    child: ProfileDataFormItem(
                      hintText: "Hassan",
                      label: "Last name",
                      name: "last_name",
                      isRequired:true,
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText: "+201234567890",
                label: "Phone number",
                name: "phone_number",
                keyboardType: const TextInputType.numberWithOptions(),
                controller: phoneController,
                isRequired:true,
              ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText: "example@email.com",
                label: "Email",
                name: "email",
                controller: emailController,
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: ProfileDataFormItem(
                      hintText: "Egypt",
                      label: "Country",
                      name: "Country",
                      controller: firstNameController,
                    ),
                  ),
                  const SizedBox(width: 3.0),
                  Expanded(
                    child: ProfileDataFormItem(
                      hintText: "New Cairo",
                      label: "City",
                      name: "city",
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
