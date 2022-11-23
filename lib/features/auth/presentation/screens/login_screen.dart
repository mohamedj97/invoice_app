import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/navigation/custom_page_route.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_email_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_password_form_field.dart';
import 'package:invoice_app/features/auth/presentation/screens/walkthrough_screen.dart';
import 'package:invoice_app/features/splash/presentation/widgets/splash_scaffold.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/login_request.dart';
import '../cubit/form_submit/formsubmit_cubit.dart';
import '../cubit/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool active = true;
  final formKey = GlobalKey<FormBuilderState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
      if (state.loginRequestState == RequestState.success) {
        Navigator.of(context)
            .push(CustomPageRoute.createRoute(page: const WalkThroughScreen()));
      }
      if (state.loginRequestState == RequestState.error) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Text(state.failure!);
          },
        );
      }
    }, builder: (context, state) {
      return SplashScaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedPositioned(
              curve: Curves.linear,
              duration: const Duration(seconds: 2),
              top: active
                  ? MediaQuery.of(context).size.height / 2
                  : MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Image.asset(ImageAssets.splashImage),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 2),
              height: active ? 0 : MediaQuery.of(context).size.height - 300,
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
                            const LWCustomText(
                              title: "Welcome Back",
                              color: AppColors.primary,
                              fontSize: 15.0,
                              fontFamily: FontAssets.avertaSemiBold,
                            ),
                            const SizedBox(height: 16.0),
                            LWCustomText(
                              title: 'sign_in'.tr(),
                              color: AppColors.blackColor,
                              fontSize: 22.0,
                              fontFamily: FontAssets.avertaSemiBold,
                            ),
                          ],
                        ),
                        LWCustomEmailFormField(
                          name: "email",
                          labelText: "Email",
                          hintText: "example@email.com",
                          isRequired: true,
                          showRequiredSymbol: false,
                          onSubmitted: (value){
                            email=value;
                          },
                          onSaved: (value){
                            email=value;
                          },
                        ),
                        LWCustomPasswordFormField(
                          name: "password",
                          labelText: "Password",
                          hintText: "*******",
                          isRequired: true,
                          showRequiredSymbol: false,
                          onSubmitted: (value){
                            password=value;
                          },
                          onSaved: (value){
                            password=value;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const LWCustomText(
                              title: "Forgot Password?",
                              color: AppColors.secondary,
                              fontFamily: FontAssets.avertaSemiBold,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomElevatedButton(
                            title: "Sign In",
                            onPressed: () async {
                              BlocProvider.of<LoginCubit>(context)
                                  .validateLoginForm(formKey);
                              BlocProvider.of<FormSubmitCubit>(context)
                                  .isSubmitField(isSubmit: true);
                              BlocProvider.of<LoginCubit>(context)
                                  .login(LoginRequest(email!, password!));
                              BlocProvider.of<FormSubmitCubit>(context)
                                  .isSubmitField(isSubmit: false);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LWCustomText(
                              title: "Language :",
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
                                    const LWCustomText(
                                      title: "Eng",
                                      fontSize: 12.0,
                                      fontFamily: FontAssets.avertaRegular,
                                      color: AppColors.blackColor,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Image.asset(IconAssets.englishIcon,
                                        width: 22.0, height: 22.0),
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
    });
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
