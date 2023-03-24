import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/image_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_elevated_button.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import '../../../../core/assets/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';

class ProfileDataScreen extends StatefulWidget {
  const ProfileDataScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {
  final TextEditingController? companyNameController = TextEditingController();
  final TextEditingController? taxNoController = TextEditingController();
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backGroundColor: Colors.white,
      title: "complete_company_data".tr(),
      body: FormBuilder(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LWCustomText(title: "account_type".tr(), fontWeight: FontWeight.bold),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => setState(() => _value = 0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundColor: _value == 0 ? AppColors.primary : AppColors.searchBarColor,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            margin: const EdgeInsets.all(3),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipOval(
                                              child: SizedBox(
                                                height: 250,
                                                width: 250,
                                                child: Image.asset(
                                                  ImageAssets.person,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        _value == 0
                                            ? Positioned(
                                                bottom: 50,
                                                right: -12,
                                                child: Center(
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        _value == 0 ? AppColors.primary : AppColors.searchBarColor,
                                                    radius: 15.0,
                                                    child: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    const SizedBox(height: 16.0),
                                    LWCustomText(
                                      title: "individuals".tr(),
                                      fontSize: 18.0,
                                      color: _value == 0 ? AppColors.primary : AppColors.searchBarColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            GestureDetector(
                              onTap: () => setState(() => _value = 1),
                              child: Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                            radius: 60,
                                            backgroundColor: _value == 1 ? AppColors.primary : AppColors.searchBarColor,
                                            child: Container(
                                                padding: const EdgeInsets.all(4),
                                                margin: const EdgeInsets.all(3),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipOval(
                                                  child: SizedBox(
                                                    height: 250,
                                                    width: 250,
                                                    child: Image.asset(
                                                      ImageAssets.company,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ))),
                                        _value == 1
                                            ? Positioned(
                                                bottom: 50,
                                                right: -12,
                                                child: Center(
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        _value == 1 ? AppColors.primary : AppColors.searchBarColor,
                                                    radius: 15.0,
                                                    child: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    const SizedBox(height: 16.0),
                                    LWCustomText(
                                      title: "company".tr(),
                                      fontSize: 18.0,
                                      color: _value == 1 ? AppColors.primary : AppColors.searchBarColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomTextFormField(
                        name: "company_name",
                        labelText: "company_name".tr(),
                        hintText: "company_name".tr(),
                        isRequired: true,
                        controller: companyNameController,
                        contentPadding: EdgeInsets.zero,
                        borderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        focusedBorderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                        ),
                        showRequiredSymbol: false,
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomTextFormField(
                        name: "tax_no",
                        labelText: "tax_no".tr(),
                        hintText: "123456789",
                        isRequired: true,
                        controller: taxNoController,
                        contentPadding: EdgeInsets.zero,
                        borderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        focusedBorderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                        ),
                        showRequiredSymbol: false,
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomText(title: "logo".tr(), color: AppColors.primary, fontSize: 16.0),
                      const SizedBox(height: 8.0),
                      DottedBorder(
                        color: Colors.grey[400]!,
                        child: Container(
                          color: Colors.grey[100],
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.arrowUpFromBracket, color: AppColors.disabledBottomItemColor),
                              LWCustomText(title: "upload".tr(), color: AppColors.disabledBottomItemColor)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomDropdownFormField<String>(
                        name: "business_activity",
                        iconColor: AppColors.labelColor,
                        showLabel: true,
                        labelText: "business_activity".tr(),
                        // initialValue: !hasData
                        //     ? initialValueUnit
                        //     : null,
                        hintText: "choose_business_activity".tr(),
                        isRequired: true,
                        isCard: false,
                        showRequiredSymbol: false,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        items: ["one", "two", "three", "four"],
                        itemBuilder: (context, data) {
                          return Text(data);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomDropdownFormField<String>(
                        name: "country",
                        iconColor: AppColors.labelColor,
                        showLabel: true,
                        labelText: "country".tr(),
                        // initialValue: !hasData
                        //     ? initialValueUnit
                        //     : null,
                        hintText: "choose_country".tr(),
                        isRequired: true,
                        isCard: false,
                        showRequiredSymbol: false,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        items: ["one", "two", "three", "four"],
                        itemBuilder: (context, data) {
                          return Text(data);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomDropdownFormField<String>(
                        name: "governorate",
                        iconColor: AppColors.labelColor,
                        showLabel: true,
                        labelText: "governorate".tr(),
                        // initialValue: !hasData
                        //     ? initialValueUnit
                        //     : null,
                        hintText: "choose_governorate".tr(),
                        isRequired: true,
                        isCard: false,
                        showRequiredSymbol: false,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        items: ["one", "two", "three", "four"],
                        itemBuilder: (context, data) {
                          return Text(data);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomDropdownFormField<String>(
                        name: "city",
                        iconColor: AppColors.labelColor,
                        showLabel: true,
                        labelText: "city".tr(),
                        // initialValue: !hasData
                        //     ? initialValueUnit
                        //     : null,
                        hintText: "choose_city".tr(),
                        isRequired: true,
                        isCard: false,
                        showRequiredSymbol: false,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        items: ["one", "two", "three", "four"],
                        itemBuilder: (context, data) {
                          return Text(data);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      LWCustomTextFormField(
                        name: "address",
                        labelText: "address".tr(),
                        hintText: "12 street dock",
                        isRequired: true,
                        controller: taxNoController,
                        contentPadding: EdgeInsets.zero,
                        borderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.searchBarColor, width: 1.0),
                        ),
                        focusedBorderDecoration: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.dataFieldColor, width: 1.0),
                        ),
                        showRequiredSymbol: false,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: AppColors.primary,width: 1.5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(FontAwesomeIcons.headset,color: AppColors.primary),
                            LWCustomText(title: "support".tr(),color: AppColors.primary),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    flex: 3,
                    child: CustomElevatedButton(
                      title: "proceed",
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
