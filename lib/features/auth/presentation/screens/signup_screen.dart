import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import 'package:invoice_app/features/auth/presentation/screens/verification_screen.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/icon_assets.dart';
import '../../../../core/assets/image_assets.dart';
import '../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_password_form_field.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import '../../../splash/presentation/widgets/splash_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool active = true;
  final formKey = GlobalKey<FormBuilderState>();
  bool firstLogin =true;
  String? email;
  String? name;
  String? password;
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SplashScaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedPositioned(
            curve: Curves.linear,
            duration: const Duration(seconds: 2),
            top: active ? MediaQuery.of(context).size.height / 2 : MediaQuery.of(context).size.height / 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: Image.asset(ImageAssets.splashImage),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 2),
            height: active ? 0 : MediaQuery.of(context).size.height - 150,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: FormBuilder(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LWCustomText(
                            title: "create_an_account".tr(),
                            color: AppColors.primary,
                            fontSize: 15.0,
                            fontFamily: FontAssets.avertaSemiBold,
                          ),
                          const SizedBox(height: 16.0),
                          LWCustomText(
                            title: 'sign_up'.tr(),
                            color: AppColors.blackColor,
                            fontSize: 22.0,
                            fontFamily: FontAssets.avertaSemiBold,
                          ),
                        ],
                      ),
                      LWCustomTextFormField(
                        name: "name",
                        labelText: "name".tr(),
                        hintText: "Ahmed",
                        isRequired: true,
                        controller: nameController,
                        contentPadding: EdgeInsets.zero,
                        borderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        focusedBorderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                        ),
                        showRequiredSymbol: false,
                        onSubmitted: (value) {
                          email = value;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      LWCustomTextFormField(
                        name: "email",
                        labelText: "email".tr(),
                        hintText: "example@email.com",
                        isRequired: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        contentPadding: EdgeInsets.zero,
                        borderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        focusedBorderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                        ),
                        showRequiredSymbol: false,
                        onSubmitted: (value) {
                          email = value;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      LWCustomPasswordFormField(
                        name: "password",
                        labelText: "password".tr(),
                        hintText: "*******",
                        isRequired: true,
                        controller: passwordController,
                        showRequiredSymbol: false,
                        onSubmitted: (value) {
                          password = value;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                      LWCustomPasswordFormField(
                        name: "confirm_password",
                        labelText: "confirm_password".tr(),
                        hintText: "*******",
                        isRequired: true,
                        controller: confirmPasswordController,
                        showRequiredSymbol: false,
                        onSubmitted: (value) {
                          password = value;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const LWCustomText(
                            title: "",
                            color: AppColors.secondary,
                            fontFamily: FontAssets.avertaSemiBold,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomElevatedButton(
                          title: "sign_up".tr(),
                          onPressed: () async {
                            Navigator.of(context).push(
                                CustomPageRoute.createRoute(page: const VerificationScreen()));
                            // var formState = formKey.currentState;
                            // if (formState == null) return;
                            // bool isValid = formState.validate();
                            // if (!isValid) {
                            //   return;
                            // }
                            // formState.save();
                            // name = formState.value["name"];
                            // email = formState.value["email"];
                            // password = formState.value["password"];
                          },
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushAndRemoveUntil(
                              CustomPageRoute.createRoute(
                                page: const LoginScreen(),
                              ),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LWCustomText(title: "have_an_account".tr(),color: AppColors.dialogueTitleColor,fontSize: 15,),
                              LWCustomText(title: " ${'sign_in'.tr()}",color: AppColors.primary,fontSize: 13,),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LWCustomText(
                            title: "${'language'.tr()} :",
                            fontSize: 12.0,
                            fontFamily: FontAssets.avertaRegular,
                            color: AppColors.blackColor,
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.dataFieldColor,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 4.0,
                                top: 4.0,
                                bottom: 4.0,
                              ),
                              child: Row(
                                children: [
                                  LWCustomText(
                                    title: "lang".tr(),
                                    fontSize: 12.0,
                                    fontFamily: FontAssets.avertaRegular,
                                    color: AppColors.blackColor,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Image.asset(IconAssets.englishIcon, width: 22.0, height: 22.0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        active = false;
      });
    });
  }
}
