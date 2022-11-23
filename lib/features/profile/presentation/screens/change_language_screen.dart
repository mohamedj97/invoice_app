import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
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
                child: const LWCustomText(
                  title: "Save",
                  color: AppColors.primary,
                  fontFamily: FontAssets.avertaSemiBold,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
      title: "language",
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilderRadioGroup<String>(
                  activeColor: AppColors.greenColor,
                  orientation: OptionsOrientation.vertical,
                  wrapRunSpacing: 24.0,
                  decoration: const InputDecoration(border: InputBorder.none),
                  initialValue: 'English- (En)',
                  name: 'best_language',
                  onChanged: (value) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  options: ['English- (En)', 'Arabic- (Ar)']
                      .map(
                        (lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Row(
                            children: [
                              LWCustomText(
                                title: lang,
                                color: AppColors.labelColor,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(growable: false),
                  controlAffinity: ControlAffinity.trailing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
