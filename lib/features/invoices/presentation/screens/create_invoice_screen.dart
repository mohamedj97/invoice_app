import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/icon_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/home/presentation/screens/home_screen.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_local_data_source.dart';
import 'package:invoice_app/features/invoices/data/models/requests/invoice_request_model.dart';
import 'package:invoice_app/features/invoices/domain/entities/lookup_code.dart';
import 'package:invoice_app/features/invoices/domain/entities/single_invoice_response.dart';
import 'package:invoice_app/features/invoices/domain/entities/tax_subtype_lookup.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/add_invoice/add_invoice_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/cubit/get_types/get_invoice_types_cubit.dart';
import 'package:invoice_app/features/invoices/presentation/screens/add_invoice_items.dart';
import 'package:invoice_app/features/invoices/presentation/screens/success_invoice_screen.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import '../../../../injection_container.dart';
import '../../../products/domain/entities/base_lookup.dart';
import '../../domain/entities/item_lookup.dart';
import '../widgets/add_price_item_in_create_invoice.dart';
import '../widgets/invoice_add_item_widget.dart';
import '../widgets/item_invoice_widget.dart';
import '../widgets/primary_and_secondary_button.dart';

class CreateEditInvoiceScreen extends StatefulWidget {
  final SingleInvoiceResponse? invoice;

  const CreateEditInvoiceScreen({Key? key, this.invoice}) : super(key: key);

  @override
  State<CreateEditInvoiceScreen> createState() => _CreateEditInvoiceScreenState();
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
  num? extraDiscountAmount;
  bool hasData = false;
  TextEditingController extraDiscountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getInvoiceTypesCubit.getInvoicesLookups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hasData = widget.invoice != null;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          CustomPageRoute.createRoute(
            page: const HomeScreen(index: 1),
          ),
          (Route<dynamic> route) => false,
        );
        InvoicesLocalDataSource.clearData();
        return true;
      },
      child: CustomScaffold(
        title: hasData ? "edit_invoice".tr() : "create_invoice".tr(),
        leading: CustomBackButton(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              CustomPageRoute.createRoute(
                page: const HomeScreen(index: 1),
              ),
              (Route<dynamic> route) => false,
            );
            InvoicesLocalDataSource.clearData();
          },
        ),
        body: BlocProvider.value(
          value: AddInvoiceCubit(sl(), sl()),
          child: BlocConsumer<AddInvoiceCubit, AddInvoiceState>(
            listener: (context, addInvoiceState) async {
              if (addInvoiceState.addInvoiceRequestState == RequestState.success) {
                InvoicesLocalDataSource.mainTaxType = null;
                InvoicesLocalDataSource.items = [];
                InvoicesLocalDataSource.addedItems = [];
                InvoicesLocalDataSource.taxTypes = [];
                InvoicesLocalDataSource.taxSubTypes = [];
                InvoicesLocalDataSource.addedTaxes = [];
                InvoicesLocalDataSource.subTaxType = null;
                InvoicesLocalDataSource.taxRate = null;
                Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute.createRoute(
                    page: const SuccessInvoiceScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
              if (addInvoiceState.addInvoiceRequestState == RequestState.error) {
                getErrorDialogue(
                  context: context,
                  isUnAuthorized: addInvoiceState.getSingleInvoiceResponse!.statuscode == 401,
                  message: addInvoiceState.getSingleInvoiceResponse?.message?.first ?? "something_went_wrong".tr(),
                );
              }
            },
            builder: (context, addInvoiceState) {
              return addInvoiceState is AddInvoiceLoading
                  ? const Center(child: CircularProgressIndicator())
                  : BlocProvider<GetInvoiceTypesCubit>.value(
                      value: getInvoiceTypesCubit,
                      child: BlocConsumer<GetInvoiceTypesCubit, GetInvoiceTypesState>(
                        listener: (context, state) async {
                          if (state.getInvoiceTypesRequestState == RequestState.success) {}
                          if (state.getInvoiceTypesRequestState == RequestState.error) {
                            getErrorDialogue(
                              context: context,
                              isUnAuthorized: state.getInvoiceTypesResponse!.statuscode == 401,
                              message: state.getInvoiceTypesResponse?.message?.first ?? "something_went_wrong".tr(),
                            );
                          }
                        },
                        builder: (context, state) {
                          customers = state.getInvoiceTypesResponse?.result?.customers ?? [];
                          invoiceTypes = state.getInvoiceTypesResponse?.result?.invoiceType ?? [];
                          branches = state.getInvoiceTypesResponse?.result?.branches ?? [];
                          unitTypes = state.getInvoiceTypesResponse?.result?.unitTypes ?? [];
                          currencies = state.getInvoiceTypesResponse?.result?.currencies ?? [];
                          taxTypes = state.getInvoiceTypesResponse?.result?.taxTypes ?? [];
                          taxSubTypes = state.getInvoiceTypesResponse?.result?.taxSubTypes ?? [];
                          countries = state.getInvoiceTypesResponse?.result?.countries ?? [];
                          paymentTerms = state.getInvoiceTypesResponse?.result?.paymentTerms ?? [];
                          items = state.getInvoiceTypesResponse?.result?.items ?? [];

                          if (hasData) {
                            InvoicesLocalDataSource.taxTypes = taxTypes;
                            InvoicesLocalDataSource.taxSubTypes = taxSubTypes;
                            extraDiscountAmount = widget.invoice?.extraDiscountAmount;
                            customerValue = state.getInvoiceTypesResponse?.result?.customers
                                .firstWhere((element) => element.id == widget.invoice?.customerId);
                            InvoicesLocalDataSource.customerId = widget.invoice!.customerId;
                            InvoicesLocalDataSource.customerName = state
                                .getInvoiceTypesResponse?.result?.customers
                                .firstWhere((element) => element.id == widget.invoice?.customerId)
                                .name;
                            InvoicesLocalDataSource.invoiceDate = widget.invoice!.invoiceDate;
                            InvoicesLocalDataSource.selectedItemsNames = [];
                            InvoicesLocalDataSource.invoiceType = state
                                .getInvoiceTypesResponse?.result?.invoiceType
                                .firstWhere((element) => element.id == widget.invoice?.invoiceTypeId);
                            for (var item in items) {
                              for (int i = 0; i < InvoicesLocalDataSource.addedItems.length; i++) {
                                if (item.id == InvoicesLocalDataSource.addedItems[i].itemId) {
                                  InvoicesLocalDataSource.selectedItemsNames.add(item.name ?? "");
                                }
                              }
                            }
                          }

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
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                                              child: LWCustomText(
                                                  title: "${"Invoice_number".tr()}${widget.invoice?.id ?? ""}",
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
                                                          child: Center(child: CircularProgressIndicator()),
                                                        )
                                                      : Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(height: 8.0),
                                                             LWCustomText(
                                                              title: "invoice_type".tr(),
                                                              color: AppColors.labelColor,
                                                              fontFamily: FontAssets.avertaRegular,
                                                            ),
                                                            const SizedBox(height: 16.0),
                                                            DropdownButtonFormField<BaseLookup>(
                                                              onChanged: (type) {
                                                                setState(() {
                                                                  InvoicesLocalDataSource.invoiceType = type;
                                                                });
                                                              },
                                                              value: InvoicesLocalDataSource.invoiceType,
                                                              validator: (value) {
                                                                if (value == null) {
                                                                  return '${"invoice_type".tr()} is required';
                                                                }
                                                              },
                                                              isExpanded: true,
                                                              decoration: InputDecoration(
                                                                enabledBorder: InputBorder.none,
                                                                focusedBorder: InputBorder.none,
                                                                fillColor: AppColors.labelColor,
                                                                errorMaxLines: 10,
                                                                hintText: "invoice_type".tr(),
                                                                hintStyle:
                                                                    const TextStyle(color: AppColors.searchBarColor),
                                                              ),
                                                              items: invoiceTypes.map((BaseLookup item) {
                                                                return DropdownMenuItem<BaseLookup>(
                                                                  value: item,
                                                                  child: Text(
                                                                    item.name ?? "",
                                                                    style: const TextStyle(
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ],
                                                        ),
                                                  const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                                                    child: Divider(
                                                      thickness: 0.5,
                                                      height: 0.0,
                                                      color: AppColors.searchBarColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      LWCustomText(
                                                        title: "invoice_date".tr(),
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
                                                                initialValue: widget.invoice!.invoiceDate,
                                                                hintText: "choose_date".tr(),
                                                              )
                                                            :  LWCustomDateFormField(
                                                                isRequired: true,
                                                                name: "invoice_date",
                                                                labelText: "",
                                                                hintText: "choose_date".tr(),
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
                                                      iconPath: IconAssets.invoiceCustomerIcon,
                                                      onTap: () {
                                                        _dialogBuilder(context);
                                                      },
                                                    )
                                                  : InvoiceAddItemWidget(
                                                      title: "add_customer".tr(),
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
                                                      title: "add_item".tr(),
                                                      iconPath: IconAssets.addItemIcon,
                                                      onTap: () {
                                                        setState(() {
                                                          InvoicesLocalDataSource.taxTypes = taxTypes;
                                                          InvoicesLocalDataSource.taxSubTypes = taxSubTypes;
                                                          InvoicesLocalDataSource.items = items;
                                                          InvoicesLocalDataSource.addedTaxes = [];
                                                        });
                                                        Navigator.of(context)
                                                            .push(CustomPageRoute.createRoute(page: AddInvoiceItems()))
                                                            .then((_) => setState(() {}));
                                                      },
                                                    ),
                                                    ListView.builder(
                                                      itemCount: InvoicesLocalDataSource.addedItems.length,
                                                      physics: const ScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemBuilder: (context, index) {
                                                        return Dismissible(
                                                          background: Container(color: AppColors.errorColor),
                                                          key: UniqueKey(),
                                                          onDismissed: (direction) {
                                                            setState(() {
                                                              InvoicesLocalDataSource.addedItems.removeAt(index);
                                                            });
                                                          },
                                                          child: Container(
                                                            color: AppColors.whiteColor,
                                                            child: InkWell(
                                                              onTap: () {
                                                                InvoicesLocalDataSource.items = items;
                                                                InvoicesLocalDataSource.addedTaxes =
                                                                    InvoicesLocalDataSource.addedItems[index].lineTax ??
                                                                        [];
                                                                Navigator.of(context)
                                                                    .push(
                                                                      CustomPageRoute.createRoute(
                                                                        page: AddInvoiceItems(
                                                                          existItem:
                                                                              InvoicesLocalDataSource.addedItems[index],
                                                                          itemName: InvoicesLocalDataSource
                                                                              .selectedItemsNames[index],
                                                                        ),
                                                                      ),
                                                                    )
                                                                    .then((_) => setState(() {}));
                                                              },
                                                              child: ItemInvoiceWidget(
                                                                item: InvoicesLocalDataSource.addedItems[index],
                                                                name: InvoicesLocalDataSource.selectedItemsNames[index],
                                                                lastItem: index + 1 ==
                                                                    InvoicesLocalDataSource.addedItems.length,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                          const SizedBox(height: 16.0),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Subtotal",
                                          //   name: "subtotal",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.totalAmount.toString()
                                          //       : null,
                                          // ),
                                          AddPriceItemInCreateInvoice(
                                            title: "extra_discount".tr(),
                                            name: "extra_discount",
                                            controller: extraDiscountController,
                                          ),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Total sales",
                                          //   name: "total_sales",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.totalAmount.toString()
                                          //       : null,
                                          // ),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Net amount",
                                          //   name: "net_amount",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.netAmount.toString()
                                          //       : null,
                                          // ),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Tax Total",
                                          //   name: "tax_total",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.totalSalesAmount.toString()
                                          //       : null,
                                          // ),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Tax Discount",
                                          //   name: "tax_discount",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.totalTaxAmount.toString()
                                          //       : null,
                                          // ),
                                          // AddPriceItemInCreateInvoice(
                                          //   title: "Total",
                                          //   name: "total",
                                          //   initialValue: hasData
                                          //       ? widget.invoice!.totalAmount.toString()
                                          //       : null,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                PrimaryAndSecondaryButton(
                                  showSecondary: false,
                                  primaryOnPressed: () {
                                    var formState = formKey.currentState;
                                    if (formState == null) return;
                                    if (!formState.saveAndValidate()) {
                                      return;
                                    }
                                    if (customerValue == null) {
                                      getErrorDialogue(
                                        context: context,
                                        isUnAuthorized: false,
                                        message: "customer_validate".tr(),
                                      );
                                    } else if (InvoicesLocalDataSource.addedItems.isEmpty) {
                                      getErrorDialogue(
                                        context: context,
                                        isUnAuthorized: false,
                                        message: "items_validate".tr(),
                                      );
                                    } else {
                                      extraDiscountAmount = num.parse(extraDiscountController.text);
                                      BlocProvider.of<AddInvoiceCubit>(context).addInvoice(
                                        InvoiceRequestModel(
                                          id: 0,
                                          invoiceType: InvoicesLocalDataSource.invoiceType!.id,
                                          invoiceDate: formState.value["invoice_date"],
                                          invoiceTypeId: InvoicesLocalDataSource.invoiceType!.id,
                                          customerId: customerValue!.id,
                                          lines: InvoicesLocalDataSource.addedItems,
                                          extraDiscountAmount: extraDiscountAmount,
                                        ),
                                      );
                                    }
                                  },
                                  primaryTitle: "submit_invoice".tr(),
                                  secondaryOnPressed: () {},
                                  secondaryTitle: "preview".tr(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: LWCustomText(
              title: 'choose_customer'.tr(), color: AppColors.blackColor, fontFamily: FontAssets.avertaSemiBold),
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
