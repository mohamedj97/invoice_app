import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice_app/core/api/repository/disk_repo.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_otp_form_field.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../injection_container.dart';
import '../../../company_registration/presentation/screens/profile_data_screen.dart';
import '../cubit/validate_code/validate_code_cubit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with TickerProviderStateMixin {
  final TextEditingController _otpController = TextEditingController(text: "");
  String? email;
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = ValidateCodeCubit(sl(), sl());
  int _start = 0;
  late AnimationController controller;
  double progress = 1.0;
  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    email = DiskRepo().loadEmail();
    _start = DiskRepo().loadValidateTime() ?? 5;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _start * 60),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "verification".tr(),
      backGroundColor: Colors.white,
      leading: const CustomBackButton(),
      body:  BlocProvider<ValidateCodeCubit>.value(
          value: cubit,
          child: BlocConsumer<ValidateCodeCubit, ValidateCodeState>(
            listener: (context, state) async {
              if (state.validateCodeRequestState == RequestState.success) {
                Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute.createRoute(page: const ProfileDataScreen()),
                  (Route<dynamic> route) => false,
                );
              }
              if (state.validateCodeRequestState == RequestState.error) {
                await getErrorDialogue(
                  context: context,
                  isUnAuthorized: state.validateCodeResponse!.statuscode == 401,
                  message: state.validateCodeResponse?.message?.first ?? "something_went_wrong".tr(),
                );
              }
              if (state.resendCodeRequestState == RequestState.error) {
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
                          child: Form(
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
                                        title: email ?? "your_mail".tr(),
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
                                    onDone: (value) async {
                                      await DiskRepo().ensureInitialized();
                                      BlocProvider.of<ValidateCodeCubit>(context)
                                          .validateCode(securityCode: value.toUpperCase(), userId: DiskRepo().loadUserId() ?? 0);
                                    },
                                    controller: _otpController,
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        AnimatedBuilder(
                                          animation: controller,
                                          builder: (context, child) => LWCustomText(
                                            title: countText,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        const SizedBox(width: 32.0),
                                        InkWell(
                                          onTap: controller.isAnimating
                                              ? null
                                              : () async {
                                                  await DiskRepo().ensureInitialized();
                                                  BlocProvider.of<ValidateCodeCubit>(context)
                                                      .resendCode(userId: DiskRepo().loadUserId() ?? 0);
                                                  controller.reverse(
                                                      from: controller.value == 0 ? 1.0 : controller.value);
                                                  setState(() {
                                                    isPlaying = true;
                                                  });
                                                },
                                          child: Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons.arrowsRotate,
                                                  color: controller.isAnimating
                                                      ? AppColors.searchBarColor
                                                      : AppColors.primary,
                                                  size: 20.0),
                                              const SizedBox(width: 8.0),
                                              LWCustomText(
                                                  title: "resend_code".tr(),
                                                  fontSize: 20.0,
                                                  color: controller.isAnimating
                                                      ? AppColors.searchBarColor
                                                      : AppColors.primary),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
            },
          )),
    );
  }
}
