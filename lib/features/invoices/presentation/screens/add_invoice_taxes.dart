import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/features/invoices/data/data_sources/invoices_local_data_source.dart';
import 'package:invoice_app/features/invoices/domain/entities/lookup_code.dart';
import '../../../../core/assets/colors.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../../domain/entities/line_tax.dart';
import '../../domain/entities/tax_subtype_lookup.dart';
import '../widgets/add_price_item_in_create_invoice.dart';

class AddInvoiceTaxes extends StatefulWidget {
  const AddInvoiceTaxes({Key? key}) : super(key: key);

  @override
  State<AddInvoiceTaxes> createState() => _AddInvoiceTaxesState();
}

class _AddInvoiceTaxesState extends State<AddInvoiceTaxes> {
  final formKeyTax = GlobalKey<FormBuilderState>();
  num? taxRate;
  List<TaxSubtypeLookup> filteredTaxSubTypes = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                Navigator.pop(context);
                setState(() {
                  filteredTaxSubTypes.clear();
                  InvoicesLocalDataSource.mainTaxType = formState.value["main_tax_type"] as LookupCode;
                  taxRate = num.parse(formState.value["rate"]);
                  InvoicesLocalDataSource.addedTaxes.add(
                    LineTax(
                        invoicelineid: 0,
                        taxSubTypeId: InvoicesLocalDataSource.subTaxType!.id,
                        taxrate: num.parse(formState.value["rate"]),
                        taxTypeId: InvoicesLocalDataSource.mainTaxType!.id,
                        taxamount: 0,
                        taxsubtypecode: "",
                        taxtypecode: ""),
                  );
                });
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
        key: formKeyTax,
        child: Column(
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
                      onChanged: (value) {
                        setState(() {
                          filteredTaxSubTypes = [];
                          InvoicesLocalDataSource.subTaxType = null;
                          InvoicesLocalDataSource.mainTaxType = value;
                          filteredTaxSubTypes = InvoicesLocalDataSource
                              .taxSubTypes
                              .where((o) => o.taxTypeId == value!.id)
                              .toList();
                        });
                      },
                      labelText: "",
                      hintText: "main_tax_type".tr(),
                      isRequired: true,
                      isCard: false,
                      items: InvoicesLocalDataSource.taxTypes,
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
                        DropdownButtonFormField<TaxSubtypeLookup>(
                          value: InvoicesLocalDataSource.subTaxType,
                          onChanged: (subValue) {
                            setState(() {
                              InvoicesLocalDataSource.subTaxType = subValue;
                            });
                          },
                          isExpanded: true,
                          validator: (value) {
                            if (value == null) {
                              return '${"sub_tax_type".tr()} is required';
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: AppColors.labelColor,
                            errorMaxLines: 10,
                            hintText: "sub_tax_type".tr(),
                            hintStyle: const TextStyle(
                                color: AppColors.searchBarColor),
                          ),
                          items:
                              filteredTaxSubTypes.map((TaxSubtypeLookup item) {
                            return DropdownMenuItem<TaxSubtypeLookup>(
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
            ),
          ],
        ),
      ),
    );
  }
}
