import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_text_form_field.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';
import 'package:invoice_app/features/products/presentation/cubit/add_product_cubit.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../../injection_container.dart';
import '../../data/models/requests/product_request_model.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? productItem;

  const AddEditProductScreen({Key? key, this.productItem}) : super(key: key);

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final cubit = AddProductCubit(sl());
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var dropdownList = [
      "1",
      "2",
      "3",
      "4",
    ];
    bool hasData = widget.productItem == null;
    return BlocProvider<AddProductCubit>.value(
      value: cubit,
      child: BlocConsumer<AddProductCubit, AddProductState>(
        listener: (context, state) async {
          if (state.addProductRequestState == RequestState.success) {
            Navigator.of(context).pushAndRemoveUntil(
              CustomPageRoute.createRoute(
                page: const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          }
          if (state.addProductRequestState == RequestState.error) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Icon(
                    Icons.warning,
                    color: AppColors.primary,
                    size: 80.0,
                  ),
                  content: Text(state.addProductResponse?.message ??
                      "something_went_wrong".tr()),
                  actions: [
                    TextButton(
                      child: LWCustomText(
                        title: 'cancel'.tr(),
                        fontFamily: FontAssets.avertaSemiBold,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            title: !hasData ? "Edit Product" : "Add item",
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
                      if (hasData) {
                        BlocProvider.of<AddProductCubit>(context).addProduct(
                          ProductModel(
                            formState.value["code"],
                            formState.value["barcode"],
                            formState.value["name"],
                            formState.value["item_type"],
                            formState.value["description"],
                            formState.value["unit_type"],
                            true,
                          ),
                        );
                      } else {}
                      // Navigator.of(context).push(
                      //     CustomPageRoute.createRoute(page: const HomeScreen()));
                    },
                    child: LWCustomText(
                      title: !hasData ? "save".tr() : "done".tr(),
                      color: AppColors.primary,
                      fontFamily: FontAssets.avertaSemiBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.whiteColor,
                        child: Column(
                          children: [
                            LWCustomTextFormField(
                              name: "name",
                              showLabel: false,
                              labelText: "",
                              hintText: "name".tr(),
                              isRequired: true,
                              initialValue:
                                  !hasData ? widget.productItem!.name : null,
                              isCard: false,
                              borderDecoration: InputBorder.none,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                thickness: 0.5,
                                height: 0.0,
                                color: AppColors.searchBarColor,
                              ),
                            ),
                            LWCustomTextFormField(
                              name: "description",
                              showLabel: false,
                              labelText: "",
                              hintText: "description".tr(),
                              initialValue: !hasData
                                  ? widget.productItem!.description
                                  : null,
                              isCard: false,
                              isRequired: true,
                              maxLines: 5,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              borderDecoration: const UnderlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: AppColors.searchBarColor,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: LWCustomText(
                                        title: "price".tr(),
                                        color: AppColors.labelColor,
                                        fontFamily: FontAssets.avertaRegular,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: LWCustomTextFormField(
                                        textAlign: TextAlign.end,
                                        name: "price",
                                        showLabel: false,
                                        labelText: "",
                                        hintText: "00.0",
                                        isRequired: true,
                                        initialValue: !hasData
                                            ? "${widget.productItem!.unittype} ${'currency_egp'.tr()}"
                                            : null,
                                        isCard: false,
                                        maxLines: 5,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(),
                                        borderDecoration: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  if(hasData)Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: LWCustomText(
                                      title: "currency_egp".tr(),
                                      color: AppColors.labelColor,
                                      fontFamily: FontAssets.avertaRegular,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                ],
                              ),
                              const SizedBox(height: 8.0),
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
                      ),


                      Container(
                        color: AppColors.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              const LWCustomText(
                                title: "Item type",
                                color: AppColors.labelColor,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                              const SizedBox(height: 16.0),
                              LWCustomDropdownFormField<String>(
                                iconColor: AppColors.labelColor,
                                name: "item_type",
                                showLabel: false,
                                labelText: "",
                                hintText: "choose_item_type".tr(),
                                isRequired: true,
                                isCard: false,
                                items: dropdownList,
                                itemBuilder: (context, data) {
                                  return Text(data);
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Divider(
                                  thickness: 0.5,
                                  height: 0.0,
                                  color: AppColors.searchBarColor,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const LWCustomText(
                                title: "Unit type",
                                color: AppColors.labelColor,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                              const SizedBox(height: 16.0),
                              LWCustomDropdownFormField<String>(
                                name: "unit_type",
                                iconColor: AppColors.labelColor,
                                showLabel: false,
                                labelText: "",
                                hintText: "choose_unit_type".tr(),
                                isRequired: true,
                                isCard: false,
                                items: dropdownList,
                                itemBuilder: (context, data) {
                                  return Text(data);
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: LWCustomText(
                                        title: "barcode".tr(),
                                        color: AppColors.labelColor,
                                        fontFamily: FontAssets.avertaRegular,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: LWCustomTextFormField(
                                        textAlign: TextAlign.end,
                                        name: "barcode",
                                        showLabel: false,
                                        labelText: "",
                                        hintText: "#123456",
                                        isRequired: true,
                                        initialValue: !hasData
                                            ? "${widget.productItem!.brickcode}"
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
