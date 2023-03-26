import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/customers/data/models/requests/customer_request_model.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/presentation/cubit/add_customer/add_edit_customer_cubit.dart';
import 'package:invoice_app/features/customers/presentation/cubit/get_customer_types/get_customer_types_cubit.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../injection_container.dart';
import '../../../products/domain/entities/base_lookup.dart';

class AddEditCustomerScreen extends StatefulWidget {
  final CustomerModel? customerItem;

  const AddEditCustomerScreen({Key? key, this.customerItem}) : super(key: key);

  @override
  State<AddEditCustomerScreen> createState() => _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState extends State<AddEditCustomerScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final cubit = AddEditCustomerCubit(sl(), sl());
  final getCustomerTypesCubit = GetCustomerTypesCubit(sl());
  List<BaseLookup> customerTypes = [];
  List<BaseLookup> countries = [];
  List<BaseLookup> governments = [];

  @override
  void initState() {
    getCustomerTypesCubit.getCustomersLookUps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.customerItem == null;
    return BlocProvider<AddEditCustomerCubit>.value(
      value: cubit,
      child: BlocConsumer<AddEditCustomerCubit, AddEditCustomerState>(
          listener: (context, state) async {
        if (state.addEditCustomerRequestState == RequestState.success) {
          Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute.createRoute(
              page: const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state.addEditCustomerRequestState == RequestState.error) {
          await getErrorDialogue(
            context: context,
            isUnAuthorized: state.addCustomerResponse!.statuscode == 401,
            message: state.addCustomerResponse?.message?.first ??
                "something_went_wrong".tr(),
          );
        }
      }, builder: (context, state) {
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

                      final String name = formState.value["name"] as String;

                      final String code = formState.value["code"] as String;

                      final String street = formState.value["street"] as String;

                      final String city = formState.value["city"] as String;

                      final String buildingNumber =
                          formState.value["building_number"];

                      final num identityId =
                          num.parse(formState.value["identity_id"]);

                      final BaseLookup customerType =
                          formState.value["customer_type"] as BaseLookup;

                      final BaseLookup country =
                          formState.value["country"] as BaseLookup;

                      final BaseLookup governorate =
                          formState.value["governorate"] as BaseLookup;

                      if (hasData) {
                        BlocProvider.of<AddEditCustomerCubit>(context)
                            .addCustomer(
                          (CustomerModelModel(
                            id: 0,
                            companyid: 0,
                            code: code,
                            name: name,
                            typeid: customerType.id,
                            identityid: identityId,
                            countryid: country.id,
                            governateid: governorate.id,
                            city: city,
                            street: street,
                            builldingnumber: buildingNumber,
                            active: true,
                          )),
                        );
                        if (state.addCustomerResponse!.statuscode == 200) {
                          Navigator.of(context).pushAndRemoveUntil(
                            CustomPageRoute.createRoute(
                              page: const HomeScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          getErrorDialogue(
                            context: context,
                            isUnAuthorized:
                                state.addCustomerResponse!.statuscode == 401,
                            message: "something_went_wrong".tr(),
                          );
                        }
                      } else {
                        BlocProvider.of<AddEditCustomerCubit>(context)
                            .editCustomer(
                          widget.customerItem!.id,
                          CustomerModelModel(
                            id: widget.customerItem!.id,
                            companyid: widget.customerItem!.companyid,
                            code: code,
                            name: name,
                            identityid: identityId,
                            countryid: country.id,
                            typeid: customerType.id,
                            governateid: governorate.id,
                            city: city,
                            street: street,
                            builldingnumber: buildingNumber,
                            active: true,
                          ),
                        );
                        if (state.stringResponse!.statuscode == 200) {
                          Navigator.of(context).pushAndRemoveUntil(
                            CustomPageRoute.createRoute(
                              page: const HomeScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          getErrorDialogue(
                            context: context,
                            isUnAuthorized:
                                state.stringResponse!.statuscode == 401,
                            message: state.stringResponse!.message?.first ??
                                "something_went_wrong".tr(),
                          );
                        }
                      }
                      // Navigator.of(context).push(
                      //     CustomPageRoute.createRoute(page: const HomeScreen()));
                    },
                    child: LWCustomText(
                      title: !hasData ? "save".tr() : "done".tr(),
                      color: AppColors.primary,
                      fontFamily: FontAssets.avertaSemiBold,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
          body: BlocProvider<GetCustomerTypesCubit>.value(
            value: getCustomerTypesCubit,
            child: BlocConsumer<GetCustomerTypesCubit, GetCustomerTypesState>(
              listener: (context, state) async {
                if (state.getCustomerTypesRequestState ==
                    RequestState.success) {}
                if (state.getCustomerTypesRequestState == RequestState.error) {
                  getErrorDialogue(
                    context: context,
                    isUnAuthorized:
                        state.getCustomerTypesResponse!.statuscode == 401,
                    message: state.getCustomerTypesResponse?.message?.first ??
                        "something_went_wrong".tr(),
                  );
                }
              },
              builder: (context, state) {
                BaseLookup? initialValueCustomerType;
                BaseLookup? initialValueCountry;
                BaseLookup? initialValueGovernment;

                if (!hasData) {
                  initialValueCustomerType = state
                      .getCustomerTypesResponse?.result?.result.customerTypes
                      .firstWhere((element) =>
                          element.id == (widget.customerItem!.typeid));

                  initialValueCountry = state
                      .getCustomerTypesResponse?.result?.result.countries
                      .firstWhere((element) =>
                          element.id == (widget.customerItem!.countryid));

                  initialValueGovernment = state
                      .getCustomerTypesResponse?.result?.result.governates
                      .firstWhere((element) =>
                          element.id == (widget.customerItem!.governateid));
                }
                countries =
                    state.getCustomerTypesResponse?.result?.result.countries ??
                        [];

                governments =
                    state.getCustomerTypesResponse?.result?.result.governates ??
                        [];

                customerTypes = state.getCustomerTypesResponse?.result?.result
                        .customerTypes ??
                    [];

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: LWCustomText(
                                title: "contact_information".tr(),
                                color: AppColors.disabledBottomItemColor),
                          ),
                          const SizedBox(height: 16.0),
                          state is GetCustomerTypesLoading
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        const LWCustomText(
                                          title: "Customer type",
                                          color: AppColors.labelColor,
                                          fontFamily: FontAssets.avertaRegular,
                                        ),
                                        const SizedBox(height: 16.0),
                                        LWCustomDropdownFormField<BaseLookup>(
                                          iconColor: AppColors.labelColor,
                                          name: "customer_type",
                                          showLabel: false,
                                          labelText: "",
                                          initialValue: !hasData
                                              ? initialValueCustomerType
                                              : null,
                                          hintText: "customer_type".tr(),
                                          isRequired: true,
                                          isCard: false,
                                          items: customerTypes,
                                          itemBuilder: (context, data) {
                                            return Text(data.name ?? "NA");
                                          },
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
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "customer_name".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "name",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "customer_name".tr(),
                                    isRequired: true,
                                    initialValue: !hasData
                                        ? widget.customerItem!.name
                                        : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
                                  ),
                                ],
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: LWCustomText(
                                            title: "code".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily:
                                                FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: LWCustomTextFormField(
                                            textAlign: TextAlign.end,
                                            name: "code",
                                            showLabel: false,
                                            labelText: "",
                                            hintText: "#123456",
                                            isRequired: true,
                                            initialValue: !hasData
                                                ? "${widget.customerItem!.code}"
                                                : null,
                                            isCard: false,
                                            maxLines: 5,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(),
                                            borderDecoration: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.0,
                                      color: AppColors.searchBarColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: LWCustomText(
                                            title: "identity_id".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily:
                                                FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: LWCustomTextFormField(
                                            textAlign: TextAlign.end,
                                            name: "identity_id",
                                            showLabel: false,
                                            labelText: "",
                                            hintText: "#123456",
                                            isRequired: true,
                                            initialValue: !hasData
                                                ? "${widget.customerItem!.identityid}"
                                                : null,
                                            isCard: false,
                                            maxLines: 5,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(),
                                            borderDecoration: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: LWCustomText(
                                title: "address_information".tr(),
                                color: AppColors.disabledBottomItemColor),
                          ),
                          const SizedBox(height: 16.0),
                          state is GetCustomerTypesLoading
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        const LWCustomText(
                                          title: "Country",
                                          color: AppColors.labelColor,
                                          fontFamily: FontAssets.avertaRegular,
                                        ),
                                        const SizedBox(height: 16.0),
                                        LWCustomDropdownFormField<BaseLookup>(
                                          iconColor: AppColors.labelColor,
                                          name: "country",
                                          showLabel: false,
                                          labelText: "",
                                          initialValue: !hasData
                                              ? initialValueCountry
                                              : null,
                                          hintText: "country".tr(),
                                          isRequired: true,
                                          isCard: false,
                                          items: countries,
                                          itemBuilder: (context, data) {
                                            return Text(data.name ?? "NA");
                                          },
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
                          state is GetCustomerTypesLoading
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        const LWCustomText(
                                          title: "Governorate",
                                          color: AppColors.labelColor,
                                          fontFamily: FontAssets.avertaRegular,
                                        ),
                                        const SizedBox(height: 16.0),
                                        LWCustomDropdownFormField<BaseLookup>(
                                          iconColor: AppColors.labelColor,
                                          name: "governorate",
                                          showLabel: false,
                                          labelText: "",
                                          initialValue: !hasData
                                              ? initialValueGovernment
                                              : null,
                                          hintText: "governorate".tr(),
                                          isRequired: true,
                                          isCard: false,
                                          items: governments,
                                          itemBuilder: (context, data) {
                                            return Text(data.name ?? "NA");
                                          },
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            thickness: 0.5,
                                            height: 0.0,
                                            color: AppColors.searchBarColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          Container(
                            color: AppColors.whiteColor,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "city".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "city",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "city".tr(),
                                    isRequired: true,
                                    initialValue: !hasData
                                        ? widget.customerItem!.city
                                        : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.0,
                                      color: AppColors.searchBarColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.whiteColor,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: LWCustomText(
                                      title: "street".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LWCustomTextFormField(
                                    name: "street",
                                    showLabel: false,
                                    labelText: "",
                                    hintText: "street".tr(),
                                    isRequired: true,
                                    initialValue: !hasData
                                        ? widget.customerItem!.street
                                        : null,
                                    isCard: false,
                                    borderDecoration: InputBorder.none,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: LWCustomText(
                                            title: "building_number".tr(),
                                            color: AppColors.labelColor,
                                            fontFamily:
                                                FontAssets.avertaRegular,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: LWCustomTextFormField(
                                            textAlign: TextAlign.end,
                                            name: "building_number",
                                            showLabel: false,
                                            labelText: "",
                                            hintText: "#123456",
                                            isRequired: true,
                                            initialValue: !hasData
                                                ? "${widget.customerItem!.builldingnumber}"
                                                : null,
                                            isCard: false,
                                            maxLines: 5,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(),
                                            borderDecoration: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
