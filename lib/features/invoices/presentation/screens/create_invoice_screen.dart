import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/invoices/domain/entities/lookup_code.dart';
import 'package:invoice_app/features/invoices/domain/entities/tax_subtype_lookup.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_types/get_invoice_types_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/success_invoice_screen.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../../../injection_container.dart';
import '../../../products/domain/entities/base_lookup.dart';
import '../../domain/entities/invoice_head_model.dart';
import '../../domain/entities/item_lookup.dart';
import '../widgets/add_price_item_in_create_invoice.dart';
import '../widgets/invoice_add_item_widget.dart';
import '../widgets/primary_and_secondary_button.dart';

class CreateEditInvoiceScreen extends StatefulWidget {
  final InvoiceHeadModel? invoice;

  const CreateEditInvoiceScreen({Key? key, this.invoice}) : super(key: key);

  @override
  State<CreateEditInvoiceScreen> createState() =>
      _CreateEditInvoiceScreenState();
}

class _CreateEditInvoiceScreenState extends State<CreateEditInvoiceScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final getInvoiceTypesCubit = GetInvoiceTypesCubit(sl());
  List<BaseLookup> invoiceTypes = [];
  List<BaseLookup> branches = [];
  List<BaseLookup> customers = [];
  List<BaseLookup> countries = [];
  List<BaseLookup> paymentTerms = [];
  List<ItemLookup> items = [];
  BaseLookup? customerValue;
  List<TaxSubtypeLookup> taxSubTypes = [];
  List<LookupCode> taxTypes = [];
  List<LookupCode> currencies = [];
  List<BaseLookup> unitTypes = [];
  List<ItemLookup> addedItems = [];
  bool hasData = false;

  @override
  void initState() {
    getInvoiceTypesCubit.getInvoicesLookups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hasData = widget.invoice != null;
    return CustomScaffold(
      title: hasData ? "Edit Invoice" : "Create invoice",
      leading: const CustomBackButton(),
      body: BlocProvider<GetInvoiceTypesCubit>.value(
        value: getInvoiceTypesCubit,
        child: BlocConsumer<GetInvoiceTypesCubit, GetInvoiceTypesState>(
          listener: (context, state) async {
            if (state.getInvoiceTypesRequestState == RequestState.success) {}
            if (state.getInvoiceTypesRequestState == RequestState.error) {
              getErrorDialogue(
                context: context,
                isUnAuthorized:
                    state.getInvoiceTypesResponse!.statuscode == 401,
                message: state.getInvoiceTypesResponse?.message ??
                    "something_went_wrong".tr(),
              );
            }
          },
          builder: (context, state) {
            BaseLookup? initialValueInvoiceType;
            if (hasData) {
              initialValueInvoiceType = state
                  .getInvoiceTypesResponse?.result?.result.invoiceTypes
                  .firstWhere((element) => element.id == widget.invoice?.id);
            }
            customers =
                state.getInvoiceTypesResponse?.result?.result.customers ?? [];
            invoiceTypes =
                state.getInvoiceTypesResponse?.result?.result.invoiceTypes ??
                    [];
            branches =
                state.getInvoiceTypesResponse?.result?.result.branches ?? [];
            unitTypes =
                state.getInvoiceTypesResponse?.result?.result.unitTypes ?? [];
            currencies =
                state.getInvoiceTypesResponse?.result?.result.currencies ?? [];
            taxTypes =
                state.getInvoiceTypesResponse?.result?.result.taxTypes ?? [];
            taxSubTypes =
                state.getInvoiceTypesResponse?.result?.result.taxSubTypes ?? [];
            countries =
                state.getInvoiceTypesResponse?.result?.result.countries ?? [];
            paymentTerms =
                state.getInvoiceTypesResponse?.result?.result.paymentTerms ??
                    [];
            items = state.getInvoiceTypesResponse?.result?.result.items ?? [];

            return FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColors.searchBarColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 16.0),
                                child: LWCustomText(
                                    title:
                                        "Invoice#${widget.invoice?.id ?? ""}",
                                    fontFamily: FontAssets.avertaSemiBold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors.searchBarColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    state is GetInvoiceTypesLoading
                                        ? const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 8.0),
                                              const LWCustomText(
                                                title: "Invoice Type",
                                                color: AppColors.labelColor,
                                                fontFamily:
                                                    FontAssets.avertaRegular,
                                              ),
                                              const SizedBox(height: 16.0),
                                              LWCustomDropdownFormField<
                                                  BaseLookup>(
                                                iconColor: AppColors.labelColor,
                                                name: "invoice_type",
                                                showLabel: false,
                                                labelText: "",
                                                initialValue: !hasData
                                                    ? initialValueInvoiceType
                                                    : null,
                                                hintText: "invoice_type".tr(),
                                                isRequired: true,
                                                isCard: false,
                                                items: invoiceTypes,
                                                itemBuilder: (context, data) {
                                                  return Text(
                                                      data.name ?? "NA");
                                                },
                                              ),
                                            ],
                                          ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Divider(
                                        thickness: 0.5,
                                        height: 0.0,
                                        color: AppColors.searchBarColor,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const LWCustomText(
                                          title: "Invoice Date",
                                          color: AppColors.labelColor,
                                          fontFamily: FontAssets.avertaRegular,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: hasData
                                              ? LWCustomDateFormField(
                                                  isRequired: true,
                                                  name: "invoice_date",
                                                  labelText: "",
                                                  initialValue: widget
                                                      .invoice!.invoiceDate,
                                                  hintText: "Choose date",
                                                )
                                              : const LWCustomDateFormField(
                                                  isRequired: true,
                                                  name: "invoice_date",
                                                  labelText: "",
                                                  hintText: "Choose date",
                                                ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            state is GetInvoiceTypesLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : customerValue != null
                                    ? InvoiceAddItemWidget(
                                        title: customerValue?.name ?? "NA",
                                        iconPath:
                                            IconAssets.invoiceCustomerIcon,
                                        onTap: () {
                                          _dialogBuilder(context);
                                        },
                                      )
                                    : InvoiceAddItemWidget(
                                        title: "Add customer",
                                        iconPath: IconAssets.addCustomerIcon,
                                        onTap: () {
                                          _dialogBuilder(context);
                                        },
                                      ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                thickness: 0.5,
                                height: 0.0,
                                color: AppColors.searchBarColor,
                              ),
                            ),
                            state is GetInvoiceTypesLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      InvoiceAddItemWidget(
                                        title: "Add item",
                                        iconPath: IconAssets.addItemIcon,
                                        onTap: () {
                                          _dialogBuilderItems(context);
                                        },
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 16.0),
                            AddPriceItemInCreateInvoice(
                              title: "Subtotal",
                              name: "subtotal",
                              initialValue: hasData
                                  ? widget.invoice!.totalAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Extra Discount",
                              name: "extra_discount",
                              initialValue: hasData
                                  ? widget.invoice!.totalAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Total sales",
                              name: "total_sales",
                              initialValue: hasData
                                  ? widget.invoice!.totalAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Net amount",
                              name: "net_amount",
                              initialValue: hasData
                                  ? widget.invoice!.netAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Tax Total",
                              name: "tax_total",
                              initialValue: hasData
                                  ? widget.invoice!.totalSalesAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Tax Discount",
                              name: "tax_discount",
                              initialValue: hasData
                                  ? widget.invoice!.totalTaxAmount.toString()
                                  : null,
                            ),
                            AddPriceItemInCreateInvoice(
                              title: "Total",
                              name: "total",
                              initialValue: hasData
                                  ? widget.invoice!.totalAmount.toString()
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PrimaryAndSecondaryButton(
                    primaryOnPressed: () {
                      var formState = formKey.currentState;
                      if (formState == null) return;
                      if (!formState.saveAndValidate()) {
                        return;
                      }
                      Navigator.of(context).push(CustomPageRoute.createRoute(
                          page: const SuccessInvoiceScreen()));
                    },
                    primaryTitle: "Submit Invoice",
                    secondaryOnPressed: () {},
                    secondaryTitle: "Preview",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _dialogBuilderTax({
    required BuildContext context,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final formKeyTax = GlobalKey<FormBuilderState>();
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          content: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomScaffold(
              title: "add_tax".tr(),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        var formState = formKeyTax.currentState;
                        if (formState == null) return;
                        if (!formState.saveAndValidate()) {
                          return;
                        }
                      },
                      child: LWCustomText(
                        title: "done".tr(),
                        color: AppColors.primary,
                        fontFamily: FontAssets.avertaSemiBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              leading: const CustomBackButton(),
              body: Column(
                children: [
                  const SizedBox(height: 24.0),
                  Container(
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          LWCustomText(
                            title: "main_tax_type".tr(),
                            color: AppColors.labelColor,
                            fontFamily: FontAssets.avertaRegular,
                          ),
                          const SizedBox(height: 16.0),
                          LWCustomDropdownFormField<LookupCode>(
                            iconColor: AppColors.labelColor,
                            name: "main_tax_type",
                            showLabel: false,
                            labelText: "",
                            // initialValue: !hasData
                            //     ? initialValueInvoiceType
                            //     : null,
                            hintText: "main_tax_type".tr(),
                            isRequired: true,
                            isCard: false,
                            items: taxTypes,
                            itemBuilder: (context, data) {
                              return Text(data.name ?? "NA");
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              LWCustomText(
                                title: "sub_tax_type".tr(),
                                color: AppColors.labelColor,
                                fontFamily: FontAssets.avertaRegular,
                              ),
                              const SizedBox(height: 16.0),
                              LWCustomDropdownFormField<TaxSubtypeLookup>(
                                iconColor: AppColors.labelColor,
                                name: "sub_tax_type",
                                showLabel: false,
                                labelText: "",
                                // initialValue: !hasData
                                //     ? initialValueInvoiceType
                                //     : null,
                                hintText: "sub_tax_type".tr(),
                                isRequired: true,
                                isCard: false,
                                items: taxSubTypes,
                                itemBuilder: (context, data) {
                                  return Text(data.name ?? "NA");
                                },
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
                  const SizedBox(height: 24.0),
                  AddPriceItemInCreateInvoice(
                    fullDivider: true,
                    title: "rate".tr(),
                    name: "rate",
                    initialValue:
                        hasData ? widget.invoice!.totalAmount.toString() : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _dialogBuilderItems(BuildContext context) {
    int? quantity;
    num? price;
    final formKeyItems = GlobalKey<FormBuilderState>();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomScaffold(
              title: "add_item".tr(),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        var formState = formKeyItems.currentState;
                        if (formState == null) return;
                        if (!formState.saveAndValidate()) {
                          return;
                        }
                      },
                      child: LWCustomText(
                        title: "done".tr(),
                        color: AppColors.primary,
                        fontFamily: FontAssets.avertaSemiBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              leading: const CustomBackButton(),
              body: FormBuilder(
                key: formKeyItems,
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Container(
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            const LWCustomText(
                              title: "Item",
                              color: AppColors.labelColor,
                              fontFamily: FontAssets.avertaRegular,
                            ),
                            const SizedBox(height: 16.0),
                            LWCustomDropdownFormField<ItemLookup>(
                              iconColor: AppColors.labelColor,
                              name: "item",
                              showLabel: false,
                              onChanged: (item) {
                                setState(() {});
                              },
                              labelText: "",
                              // initialValue: !hasData
                              //     ? initialValueCountry
                              //     : null,
                              hintText: "choose_item".tr(),
                              isRequired: true,
                              isCard: false,
                              items: items,
                              itemBuilder: (context, data) {
                                return Text(data.name ?? "NA");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    AddPriceItemInCreateInvoice(
                      hintText: "00",
                      showCurrency: false,
                      title: "quantity".tr(),
                      name: "quantity",
                      initialValue: hasData
                          ? widget.invoice!.totalAmount.toString()
                          : null,
                    ),
                    AddPriceItemInCreateInvoice(
                      title: "price".tr(),
                      name: "price",
                      initialValue: hasData
                          ? widget.invoice!.totalAmount.toString()
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    AddPriceItemInCreateInvoice(
                      title: "discount".tr(),
                      name: "discount",
                      initialValue: hasData
                          ? widget.invoice!.totalAmount.toString()
                          : null,
                    ),
                    InvoiceAddItemWidget(
                      title: "add_tax".tr(),
                      iconPath: IconAssets.addCustomerIcon,
                      onTap: () {
                        _dialogBuilderTax(context: context);
                      },
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

  Future<void> _dialogBuilder(
      BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: LWCustomText(
              title: 'choose_customer'.tr(),
              color: AppColors.blackColor,
              fontFamily: FontAssets.avertaSemiBold),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              customerValue = customers[index];
                            });
                            print(
                                '${customerValue!.name}  ${customerValue!.id}   sssssssssssssssssssssssssssss');
                            Navigator.pop(context);
                          },
                          child: LWCustomText(
                            title: customers[index].name ?? "NA",
                            color: AppColors.labelColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Divider(
                        thickness: 0.5,
                        height: 0.0,
                        color: AppColors.searchBarColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
