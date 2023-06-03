import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/models/tokens_data.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/navigation/custom_page_route.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_password_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:invoice_app/features/auth/presentation/screens/walkthrough_screen.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import 'package:invoice_app/features/splash/presentation/widgets/splash_scaffold.dart';
import '../../../../core/api/repository/disk_repo.dart';
import '../../../../core/api/repository/memory_repo.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/cubit/get_profile_cubit.dart';
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
  final profileCubit = GetProfileCubit(sl(),sl());
  bool firstLogin = true;
  String? email;
  String? password;
  final TextEditingController? userNameController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProfileCubit>.value(
      value: profileCubit,
      child: BlocConsumer<GetProfileCubit, GetProfileState>(
        listener: (context, profileState) async {
          if (profileState.getProfileRequestState == RequestState.success) {
            await DiskRepo().deleteUserName();
            await DiskRepo().deleteUserId();
            await DiskRepo().updateUserName(profileState.getProfileResponse?.result?.userName ?? "");
            await DiskRepo().updateUserId(profileState.getProfileResponse?.result?.userId ?? 0);
            firstLogin = DiskRepo().loadFirstLogin() ?? true;
            if (firstLogin) {
              Navigator.of(context).pushAndRemoveUntil(
                CustomPageRoute.createRoute(
                  page: const WalkThroughScreen(),
                ),
                (Route<dynamic> route) => false,
              );
             await DiskRepo().updateFirstLogin(false);
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                CustomPageRoute.createRoute(
                  page: const HomeScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          }
          if (profileState.getProfileRequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: profileState.getProfileResponse!.statuscode == 401,
              message: profileState.getProfileResponse?.message?.first ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, profileState) {
          return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) async {
            if (state.loginRequestState == RequestState.success) {
              BlocProvider.of<GetProfileCubit>(context).getProfile();
              firstLogin = DiskRepo().loadFirstLogin() ?? true;
              if (firstLogin) {
                await DiskRepo().deleteTokensData();
                await DiskRepo().updateTokensData(TokensData.fromLoginResponse(state.loginResponse!));
              } else {
                await DiskRepo().deleteTokensData();
                await DiskRepo().updateTokensData(TokensData.fromLoginResponse(state.loginResponse!));
              }
            }
            if (state.loginRequestState == RequestState.error) {
              await DiskRepo().clearAll();
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Icon(
                      Icons.warning,
                      color: AppColors.primary,
                      size: 80.0,
                    ),
                    content: Text(state.loginResponse?.message?.first ?? "something_went_wrong".tr()),
                    actions: [
                      TextButton(
                        child: LWCustomText(
                          title: 'cancel'.tr(),
                          fontFamily: FontAssets.avertaSemiBold,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
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
                    top: active ? MediaQuery.of(context).size.height / 2 : MediaQuery.of(context).size.height / 7,
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
                        child: profileState is GetProfileLoading
                            ? const Center(child: CircularProgressIndicator())
                            : state is LoginLoading
                                ? const Center(child: CircularProgressIndicator())
                                : FormBuilder(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            LWCustomText(
                                              title: "welcome_back".tr(),
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
                                        LWCustomTextFormField(
                                          name: "username",
                                          labelText: "user_name".tr(),
                                          hintText: "Ahmed",
                                          isRequired: true,
                                          controller: userNameController,
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
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: state is LoginLoading ? null : () {},
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
                                            title: "sign_in".tr(),
                                            onPressed: () async {
                                              await MemoryRepo().ensureInitialized();
                                              await DiskRepo().ensureInitialized();
                                              BlocProvider.of<LoginCubit>(context).validateLoginForm(formKey);
                                              BlocProvider.of<FormSubmitCubit>(context).isSubmitField(isSubmit: true);
                                              BlocProvider.of<LoginCubit>(context)
                                                  .login(LoginRequest(email!, password!));
                                              BlocProvider.of<FormSubmitCubit>(context).isSubmitField(isSubmit: false);
                                            },
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(
                                                  CustomPageRoute.createRoute(page: const SignupScreen()));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                LWCustomText(
                                                  title: "do_not_have_an_account".tr(),
                                                  color: AppColors.dialogueTitleColor,
                                                  fontSize: 15,
                                                ),
                                                LWCustomText(
                                                  title: " ${'sign_up'.tr()}",
                                                  color: AppColors.primary,
                                                  fontSize: 13,
                                                ),
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
          });
        },
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
