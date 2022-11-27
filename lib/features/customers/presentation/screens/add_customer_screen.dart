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
      title: !hasData ? "Edit Customer" : "Add Customer",
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
                    title: !hasData ? "Save" : "Done",
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
                const Padding(
                  padding:  EdgeInsets.only(left: 8.0),
                  child:  LWCustomText(
                      title: "CONTACT INFORMATION",
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
                        const LWCustomText(
                          title: "Customer type",
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
                              hintText: "Choose type",
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
                      hintText: "Name",
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
                            const LWCustomText(
                              title: "Code",
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
                                      ? "widget.customerItem!.code"
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
                            const LWCustomText(
                              title: "Identity id",
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
                                      ? "widget.customerItem!.identityID"
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
                  const Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: LWCustomText(
                      title: "ADDRESS INFORMATION",
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
                        const LWCustomText(
                          title: "Country",
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
                              hintText: "Choose Country",
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
                        const LWCustomText(
                          title: "Governorate",
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
                              hintText: "Choose Governorate",
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
                        const LWCustomText(
                          title: "City",
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
                              hintText: "Choose City",
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
                      hintText: "Street",
                      isRequired: true,
                      initialValue: !hasData ? "widget.customerItem!.street" : null,
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
                      hintText: "Building number",
                      isRequired: true,
                      initialValue: !hasData ?" widget.customerItem!.buildingNumber" : null,
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
