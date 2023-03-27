import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_otp_form_field.dart';
import '../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../injection_container.dart';
import '../../../company_registration/presentation/screens/profile_data_screen.dart';
import '../cubit/form_submit/formsubmit_cubit.dart';
import '../cubit/validate_code/validate_code_cubit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController? otpTEC;
  String? email;
  String? otp;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    email = DiskRepo().loadEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "verification".tr(),
      backGroundColor: Colors.white,
      leading: const CustomBackButton(),
      body: BlocProvider.value(
          value: ValidateCodeCubit(sl(), sl()),
          child: BlocConsumer<ValidateCodeCubit, ValidateCodeState>(
            listener: (context, state) async {
              if (state.validateCodeRequestState == RequestState.success) {
                Navigator.of(context).pushAndRemoveUntil(CustomPageRoute.createRoute(page: const ProfileDataScreen()),(Route<dynamic> route) => false,);
              }
              if (state.validateCodeRequestState == RequestState.error) {
                await getErrorDialogue(
                  context: context,
                  isUnAuthorized: state.validateCodeResponse!.statuscode == 401,
                  message: state.validateCodeResponse?.message?.first ?? "something_went_wrong".tr(),
                );
              }
            },
            builder: (context, state) {
              return state is ValidateCodeLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
                      child: FormBuilder(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LWCustomText(
                              title: "email_verification".tr(),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 32.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LWCustomText(
                                  title: "we_sent_a_code_to".tr(),
                                  color: AppColors.searchBarColor,
                                  fontSize: 16.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: LWCustomText(
                                    title: email ?? "your mail".tr(),
                                    color: AppColors.primary,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            LWCustomText(
                              title: "please_write_down".tr(),
                              color: AppColors.searchBarColor,
                              fontSize: 16.0,
                            ),
                            const SizedBox(height: 32.0),
                            Center(
                              child: LWCustomOTPFormField(
                                name: "otp",
                                isRequired: true,
                                controller: otpTEC,
                                length: 6,
                                onChanged: (v) {
                                  setState(() {
                                    otp = v??"";
                                  });
                                },
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CustomElevatedButton(
                                title: "verify".tr(),
                                onPressed: () async {
                                  await DiskRepo().ensureInitialized();
                                  BlocProvider.of<ValidateCodeCubit>(context).validateValidateCodeForm(formKey);
                                  BlocProvider.of<FormSubmitCubit>(context).isSubmitField(isSubmit: true);
                                  BlocProvider.of<ValidateCodeCubit>(context).validateCode(
                                      userId: DiskRepo().loadUserId() ?? 0, securityCode: otp?.toUpperCase()?? "");
                                  BlocProvider.of<FormSubmitCubit>(context).isSubmitField(isSubmit: false);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            },
          )),
    );
  }
}
