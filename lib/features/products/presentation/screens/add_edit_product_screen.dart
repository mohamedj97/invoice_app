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
import '../../data/models/requests/product_request_model.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? productItem;

  const AddEditProductScreen({Key? key, this.productItem}) : super(key: key);

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.productItem == null;
    return BlocConsumer<AddProductCubit, AddProductState>(
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
                          formState.value["type"],
                          formState.value["description"],
                          formState.value["item_type"],
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                LWCustomText(
                                  title: "price".tr(),
                                  color: AppColors.labelColor,
                                  fontFamily: FontAssets.avertaRegular,
                                ),
                                SizedBox(
                                  width: 110.0,
                                  height: 70.0,
                                  child: Center(
                                    child: LWCustomTextFormField(
                                      name: "price",
                                      showLabel: false,
                                      labelText: "",
                                      hintText: "00.0 ${'currency_egp'.tr()}",
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
                                  title: "Item type",
                                  color: AppColors.labelColor,
                                  fontFamily: FontAssets.avertaRegular,
                                ),
                                SizedBox(
                                  width: 110.0,
                                  height: 70.0,
                                  child: Center(
                                    child: LWCustomTextFormField(
                                      name: "item_type",
                                      showLabel: false,
                                      labelText: "",
                                      hintText: "GS1",
                                      isCard: false,
                                      isRequired: true,
                                      initialValue: !hasData
                                          ? widget.productItem!.type
                                          : null,
                                      maxLines: 5,
                                      keyboardType: const TextInputType
                                          .numberWithOptions(),
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
                                  title: "barcode".tr(),
                                  color: AppColors.labelColor,
                                  fontFamily: FontAssets.avertaRegular,
                                ),
                                SizedBox(
                                  width: 110.0,
                                  height: 70.0,
                                  child: Center(
                                    child: LWCustomTextFormField(
                                      name: "barcode",
                                      showLabel: false,
                                      labelText: "",
                                      hintText: "#123456",
                                      isCard: false,
                                      isRequired: true,
                                      initialValue: !hasData
                                          ? widget.productItem!.brickcode
                                          : null,
                                      maxLines: 5,
                                      keyboardType: const TextInputType
                                          .numberWithOptions(),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
