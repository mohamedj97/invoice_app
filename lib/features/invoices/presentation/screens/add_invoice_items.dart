import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/assets/icon_assets.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../data/data_sources/invoices_local_data_source.dart';
import '../../domain/entities/invoice_line.dart';
import '../../domain/entities/item_lookup.dart';
import '../../domain/entities/line_total.dart';
import '../widgets/add_price_item_in_create_invoice.dart';
import '../widgets/invoice_add_item_widget.dart';
import 'add_invoice_taxes.dart';

class AddInvoiceItems extends StatefulWidget {
  const AddInvoiceItems({Key? key}) : super(key: key);

  @override
  State<AddInvoiceItems> createState() => _AddInvoiceItemsState();
}

class _AddInvoiceItemsState extends State<AddInvoiceItems> {
  final formKeyItems = GlobalKey<FormBuilderState>();
  num? quantity;
  ItemLookup? item;
  num? price;
  num? discountRate;
  LineTotal lineTotal = LineTotal(salesTotal: 0, netTotal: 0, total: 0, lineTaxTotal: []);
  TextEditingController priceController = TextEditingController(text: "00");

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                quantity = num.parse(formState.value["quantity"]);
                discountRate = num.parse(formState.value["quantity"]);
                item = formState.value["item"] as ItemLookup;
                price = num.parse(priceController.text);
                setState(() {
                  for (int i = 0; i < InvoicesLocalDataSource.addedItems.length; i++) {
                    if (InvoicesLocalDataSource.addedItems[i].itemId == item!.id) {
                      InvoicesLocalDataSource.addedItems.remove(InvoicesLocalDataSource.addedItems[i]);
                      InvoicesLocalDataSource.selectedItemsNames.remove(InvoicesLocalDataSource.selectedItemsNames[i]);
                    }
                  }
                  InvoicesLocalDataSource.addedItems.add(
                    Line(
                      itemDescription: item!.description!,
                      itemId: item!.id,
                      unitType: item!.unittypeID,
                      quantity: quantity ?? 0,
                      currencyId: 70,
                      priceEgp: price ?? 00,
                      lineTotal: lineTotal,
                      discountRate: discountRate,
                      lineTax: InvoicesLocalDataSource.addedTaxes,
                      discountAmount: 0,
                      exchangeRate: 0,
                    ),
                  );
                  InvoicesLocalDataSource.selectedItemsNames.add(item?.name ?? "");
                });
                Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: FormBuilder(
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
                          setState(() {
                            priceController.text = item!.price.toString();
                          });
                        },
                        labelText: "",
                        // initialValue: !hasData
                        //     ? initialValueCountry
                        //     : null,
                        hintText: "choose_item".tr(),
                        isRequired: true,
                        isCard: false,
                        items: InvoicesLocalDataSource.items,
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
                // initialValue: hasData
                //     ? widget.invoice!.totalAmount.toString()
                //     : null,
              ),
              AddPriceItemInCreateInvoice(
                title: "price".tr(),
                name: "price",
                controller: priceController,
              ),
              const SizedBox(height: 16.0),
              AddPriceItemInCreateInvoice(
                title: "discount_rate".tr(),
                name: "discount_rate",
                isRequired: false,
              ),
              InvoiceAddItemWidget(
                title: "add_tax".tr(),
                iconPath: IconAssets.addCustomerIcon,
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute.createRoute(page: const AddInvoiceTaxes()))
                      .then((_) => setState(() {}));
                },
              ),
              ListView.builder(
                itemCount: InvoicesLocalDataSource.addedTaxes.length,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: AppColors.whiteColor, border: Border.all(color: AppColors.labelColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LWCustomText(
                              title: "main_tax_type".tr(),
                              color: AppColors.labelColor,
                            ),
                            const SizedBox(height: 8.0),
                            LWCustomText(title: InvoicesLocalDataSource.mainTaxType?.name ?? ""),
                            const SizedBox(height: 8.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                thickness: 0.5,
                                height: 0.0,
                                color: AppColors.searchBarColor,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            LWCustomText(title: "sub_tax_type".tr(), color: AppColors.labelColor),
                            const SizedBox(height: 8.0),
                            LWCustomText(title: InvoicesLocalDataSource.subTaxType?.name ?? ""),
                            const SizedBox(height: 8.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                thickness: 0.5,
                                height: 0.0,
                                color: AppColors.searchBarColor,
                              ),
                            ),
                            InvoicesLocalDataSource.taxRate == null ? const SizedBox() : const SizedBox(height: 8.0),
                            InvoicesLocalDataSource.taxRate == null
                                ? const SizedBox()
                                : LWCustomText(title: "tax_rate".tr(), color: AppColors.labelColor),
                            LWCustomText(
                                title: InvoicesLocalDataSource.taxRate == null
                                    ? ""
                                    : InvoicesLocalDataSource.taxRate.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
