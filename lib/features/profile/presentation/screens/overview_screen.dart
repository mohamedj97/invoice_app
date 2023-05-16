import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/features/profile/domain/entities/company_info.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/profile_data_form_item.dart';

class OverviewScreen extends StatefulWidget {
  final CompanyInfo? companyInfo;
  const OverviewScreen({Key? key, required this.companyInfo}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController additionalDetailsController =
      TextEditingController();
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
                  color: AppColors.primary,
                  fontFamily: FontAssets.avertaSemiBold,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
      title: "overview".tr(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              ProfileDataFormItem(
                hintText: "Zara Store",
                label: "business_name".tr(),
                name: "business_name",
                initialValue: widget.companyInfo!.name,
                isRequired: true,
              ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText: "Egypt",
                label: "country".tr(),
                name: "country",
                initialValue: widget.companyInfo!.country.toString()=="65"?"Egypt":null,
                isRequired: true,
              ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText: "cairo",
                label: "city".tr(),
                name: "city",
                initialValue: widget.companyInfo!.city,
                isRequired: true,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         decoration: const BoxDecoration(
              //           color: AppColors.whiteColor,
              //           border: Border(
              //             bottom: BorderSide(
              //               color: AppColors.blackColor,
              //               width: 0.25,
              //             ),
              //           ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 4.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 8.0),
              //                 child: LWCustomText(
              //                   title: "country".tr(),
              //                   color: AppColors.labelColor,
              //                   fontSize: 14.0,
              //                   fontFamily: FontAssets.avertaRegular,
              //                 ),
              //               ),
              //               LWCustomDropdownFormField<String>(
              //                 items: ["sss", "ddd", "eee"],
              //                 itemBuilder: (context, value) {
              //                   return Text(value);
              //                 },
              //                 iconColor: AppColors.blackColor,
              //                 isRequired: true,
              //                 isCard: false,
              //                 showLabel: false,
              //                 labelText: "",
              //                 hintText: "Egypt",
              //                 name: "country",
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 3.0),
              //     Expanded(
              //       child: Container(
              //         decoration: const BoxDecoration(
              //           color: AppColors.whiteColor,
              //           border: Border(
              //             bottom: BorderSide(
              //               color: AppColors.blackColor,
              //               width: 0.25,
              //             ),
              //           ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 4.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //                Padding(
              //                 padding: const EdgeInsets.only(left: 8.0),
              //                 child: LWCustomText(
              //                   title: "city".tr(),
              //                   color: AppColors.labelColor,
              //                   fontSize: 14.0,
              //                   fontFamily: FontAssets.avertaRegular,
              //                 ),
              //               ),
              //               LWCustomDropdownFormField<String>(
              //                 items: ["sss", "ddd", "eee"],
              //                 itemBuilder: (context, value) {
              //                   return Text(value);
              //                 },
              //                 iconColor: AppColors.blackColor,
              //                 isRequired: true,
              //                 isCard: false,
              //                 showLabel: false,
              //                 labelText: "",
              //                 hintText: "Cairo",
              //                 name: "city",
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 24.0),
              ProfileDataFormItem(
                hintText:
                    "90th street, fifth settlement, next to the university of the future",
                label: "additional_details".tr(),
                name: "additional_details",
                isRequired: true,
                maxLines: 3,
                initialValue: widget.companyInfo!.additionalinformation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
