import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/profile_data_form_item.dart';

class BusinessDataScreen extends StatefulWidget {
  const BusinessDataScreen({Key? key}) : super(key: key);

  @override
  State<BusinessDataScreen> createState() => _BusinessDataScreenState();
}

class _BusinessDataScreenState extends State<BusinessDataScreen> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController additionalDetailsController = TextEditingController();
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
                    title: "Save", color: AppColors.primary,fontFamily: FontAssets.avertaSemiBold,fontWeight: FontWeight.bold,)),
          ),
        ),
      ],
      title: "business data",
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              ProfileDataFormItem(
                hintText: "Zara Store",
                label: "Business Name",
                name: "business_name",
                isRequired: true,
                controller: businessNameController,
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:  EdgeInsets.only(left: 8.0),
                              child: LWCustomText(
                                title: "Country",
                                color: AppColors.labelColor,
                                fontSize: 14.0,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                            ),
                            LWCustomDropdownFormField<String>(
                              items: ["sss","ddd","eee"],
                              itemBuilder: (context,value){
                                return Text(value);
                              },
                              iconColor: AppColors.blackColor,
                              isRequired: true,
                              isCard: false,
                              showLabel: false,
                              labelText: "",
                              hintText: "Egypt",
                              name: "country",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 3.0),
                  Expanded(
                    child: Container(
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
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:  EdgeInsets.only(left: 8.0),
                              child: LWCustomText(
                                title: "City",
                                color: AppColors.labelColor,
                                fontSize: 14.0,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                            ),
                            LWCustomDropdownFormField<String>(
                              items: ["sss","ddd","eee"],
                              itemBuilder: (context,value){
                                return Text(value);
                              },
                              iconColor: AppColors.blackColor,
                              isRequired: true,
                              isCard: false,
                              showLabel: false,
                              labelText: "",
                              hintText: "Cairo",
                              name: "city",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText:
                    "90th street, fifth settlement, next to the university of the future",
                label: "Additional Details",
                name: "additional_details",
                isRequired: true,
                maxLines: 3,
                controller: additionalDetailsController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
