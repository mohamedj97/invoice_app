import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/auth/presentation/screens/login_screen.dart';
import 'package:invoice_app/features/profile/domain/entities/user_info_data.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/cubit/validate_code/validate_code_cubit.dart';
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
  final validateCodeCubit = ValidateCodeCubit(sl(), sl(), sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValidateCodeCubit>.value(
      value: validateCodeCubit,
      child: BlocConsumer<ValidateCodeCubit, ValidateCodeState>(
        listener: (context, state) async {
          if (state.deleteUserRequestState == RequestState.success) {
            Navigator.of(context).pushAndRemoveUntil(
              CustomPageRoute.createRoute(
                page: const LoginScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          }
          if (state.deleteUserRequestState == RequestState.error) {
            await getErrorDialogue(
              context: context,
              isUnAuthorized: state.boolResponse!.statuscode == 401,
              message: state.boolResponse?.message?.first ?? "something_went_wrong".tr(),
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
                      onTap: () {
                        var formState = formKey.currentState;
                        if (formState == null) return;
                        if (!formState.saveAndValidate()) {
                          return;
                        }
                        Navigator.of(context).push(CustomPageRoute.createRoute(page: const HomeScreen()));
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
            title: "profile_data".tr(),
            body: state is ValidateCodeLoading
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    ProfileDataFormItem(
                      hintText: "Hazem",
                      label: "full_name".tr(),
                      name: "full_name",
                      isRequired: true,
                      initialValue: widget.user.userName,
                    ),
                    const SizedBox(height: 24.0),
                    ProfileDataFormItem(
                      hintText: "example@email.com",
                      label: "email".tr(),
                      name: "email",
                      initialValue: widget.user.email,
                    ),
                    const SizedBox(height: 50.0),
                    InkWell(
                      onTap: () async {
                       showAlertDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(IconAssets.deleteUserIcon,height: 30,width: 30,),
                            const SizedBox(width: 8.0),
                            LWCustomText(title: "delete_user".tr(), color: AppColors.primary),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = CustomElevatedButton(
      title: "cancel".tr(),
      color: Colors.white,
      textColor: AppColors.primary,
      onPressed: () {
        Navigator.of(
          context,
        ).pop();
      },
    );
    Widget continueButton = CustomElevatedButton(
      title: "confirm".tr(),
      onPressed: () async {
        await BlocProvider.of<ValidateCodeCubit>(context)
            .deleteUser(userId: DiskRepo().loadUserId() ?? 0);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: LWCustomText(title: "delete_user".tr()),
      content: LWCustomText(title: "delete_user_description".tr()),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
