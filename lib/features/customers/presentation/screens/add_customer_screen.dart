import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/custom_back_button.dart';

class AddCustomerScreen extends StatefulWidget {
  final CustomerModel? customerItem;

  const AddCustomerScreen({Key? key, this.customerItem}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.customerItem == null;
    var dropdownList = [
      "1",
      "2",
      "3",
      "4",
    ];
    return CustomScaffold(
      title: !hasData ? "edit_customer".tr() : "add_customer".tr(),
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
                    title: !hasData ? "save".tr() : "done".tr(),
                    color: AppColors.primary,fontFamily: FontAssets.avertaSemiBold,fontWeight: FontWeight.bold,)),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:  LWCustomText(
                      title: "contact_information".tr(),
                      color: AppColors.disabledBottomItemColor),
                ),
                const SizedBox(height: 16.0),
                Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LWCustomText(
                          title: "customer_type".tr(),
                          color: AppColors.labelColor,
                          fontFamily: FontAssets.avertaRegular,
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 70.0,
                          child: Center(
                            child: LWCustomDropdownFormField<String>(
                              name: "customer_type",
                              showLabel: false,
                              labelText: "",
                              hintText: "choose_type".tr(),
                              isRequired: true,
                              isCard: false,
                              items: dropdownList,
                              itemBuilder: (context, data) {
                                return Text(data);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                Container(
                  height: 80,
                  color: AppColors.whiteColor,
                  child: Center(
                    child: LWCustomTextFormField(
                      name: "name",
                      showLabel: false,
                      labelText: "",
                      hintText: "name".tr(),
                      isRequired: true,
                      initialValue: !hasData ? "widget.customerItem!.name" : null,
                      isCard: false,
                      borderDecoration: InputBorder.none,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 0.0,
                  color: AppColors.searchBarColor,
                ),
                const SizedBox(height: 16.0),
                Container(
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LWCustomText(
                              title: "code".tr(),
                              color: AppColors.labelColor,
                              fontFamily: FontAssets.avertaRegular,
                            ),
                            SizedBox(
                              width: 110.0,
                              height: 70.0,
                              child: Center(
                                child: LWCustomTextFormField(
                                  name: "code",
                                  showLabel: false,
                                  labelText: "",
                                  hintText: "#123456",
                                  isCard: false,
                                  isRequired: true,
                                  initialValue: !hasData
                                      ? widget.customerItem!.code
                                      : null,
                                  maxLines: 5,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  borderDecoration: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 0.5,
                          height: 0.0,
                          color: AppColors.searchBarColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LWCustomText(
                              title: "identity_id".tr(),
                              color: AppColors.labelColor,
                              fontFamily: FontAssets.avertaRegular,
                            ),
                            SizedBox(
                              width: 110.0,
                              height: 70.0,
                              child: Center(
                                child: LWCustomTextFormField(
                                  name: "identity_id",
                                  showLabel: false,
                                  labelText: "",
                                  hintText: "#123456",
                                  isCard: false,
                                  isRequired: true,
                                  initialValue: !hasData
                                      ? widget.customerItem?.identityid.toString()
                                      : null,
                                  maxLines: 5,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  borderDecoration: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        height: 0.0,
                        color: AppColors.searchBarColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                   Padding(
                    padding:  const EdgeInsets.only(left: 8.0),
                    child: LWCustomText(
                      title: "address_information".tr(),
                      color: AppColors.disabledBottomItemColor),
                  ),
                const SizedBox(height: 16.0),
                Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LWCustomText(
                          title: "country".tr(),
                          color: AppColors.labelColor,
                          fontFamily: FontAssets.avertaRegular,
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 70.0,
                          child: Center(
                            child: LWCustomDropdownFormField<String>(
                              name: "country",
                              showLabel: false,
                              labelText: "",
                              hintText: "choose_country".tr(),
                              isRequired: true,
                              isCard: false,
                              items: dropdownList,
                              itemBuilder: (context, data) {
                                return Text(data);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LWCustomText(
                          title: "governorate".tr(),
                          color: AppColors.labelColor,
                          fontFamily: FontAssets.avertaRegular,
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 70.0,
                          child: Center(
                            child: LWCustomDropdownFormField<String>(
                              name: "governorate",
                              showLabel: false,
                              labelText: "",
                              hintText: "choose_governorate".tr(),
                              isRequired: true,
                              isCard: false,
                              items: dropdownList,
                              itemBuilder: (context, data) {
                                return Text(data);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LWCustomText(
                          title: "city".tr(),
                          color: AppColors.labelColor,
                          fontFamily: FontAssets.avertaRegular,
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 70.0,
                          child: Center(
                            child: LWCustomDropdownFormField<String>(
                              name: "city",
                              showLabel: false,
                              labelText: "",
                              hintText: "choose_city".tr(),
                              isRequired: true,
                              isCard: false,
                              items: dropdownList,
                              itemBuilder: (context, data) {
                                return Text(data);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                Container(
                  height: 80,
                  color: AppColors.whiteColor,
                  child: Center(
                    child: LWCustomTextFormField(
                      name: "street",
                      showLabel: false,
                      labelText: "",
                      hintText: "street".tr(),
                      isRequired: true,
                      initialValue: !hasData ? widget.customerItem!.street : null,
                      isCard: false,
                      borderDecoration: InputBorder.none,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                Container(
                  height: 80,
                  color: AppColors.whiteColor,
                  child: Center(
                    child: LWCustomTextFormField(
                      name: "building_number",
                      showLabel: false,
                      labelText: "",
                      hintText: "building_number".tr(),
                      isRequired: true,
                      initialValue: !hasData ? widget.customerItem!.builldingnumber : null,
                      isCard: false,
                      borderDecoration: InputBorder.none,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  height: 0.0,
                  color: AppColors.searchBarColor,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
