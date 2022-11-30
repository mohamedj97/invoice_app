import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/features/invoices/presentation/screens/success_invoice_screen.dart';
import '../../../../core/common_widgets/custom_scaffold.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import '../../domain/entities/invoice_head_model.dart';
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

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.invoice != null;
    return CustomScaffold(
      title: hasData ? "Edit Invoice" : "Create invoice",
      leading: const CustomBackButton(),
      body: FormBuilder(
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
                              title: "Invoice#${widget.invoice?.id ?? ""}",
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                            initialValue:
                                                widget.invoice!.dateValidity,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LWCustomText(
                                    title: "Due Date",
                                    color: AppColors.labelColor,
                                    fontFamily: FontAssets.avertaRegular,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: hasData
                                        ? LWCustomDateFormField(
                                            name: "due_date",
                                            isRequired: true,
                                            labelText: "",
                                            initialValue:
                                                widget.invoice!.dateValidity,
                                            hintText: "Choose date",
                                          )
                                        : const LWCustomDateFormField(
                                            name: "due_date",
                                            isRequired: true,
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
                      hasData
                          ? InvoiceAddItemWidget(
                              title: widget.invoice?.customerName ?? "",
                              iconData: Icons.person,
                              onTap: () {},
                            )
                          : InvoiceAddItemWidget(
                              title: "Add customer",
                              iconData: Icons.person_add_alt,
                              onTap: () {},
                            ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 0.5,
                          height: 0.0,
                          color: AppColors.searchBarColor,
                        ),
                      ),
                      InvoiceAddItemWidget(
                        title: "Add item",
                        iconData: Icons.add_card_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(height: 16.0),
                      AddPriceItemInCreateInvoice(
                        title: "Subtotal",
                        name: "subtotal",
                        initialValue: hasData
                            ? widget.invoice!.totalAmount.toString()
                            : null,
                      ),
                      InvoiceAddItemWidget(
                        title: "Add Discount",
                        iconData: Icons.discount_outlined,
                        onTap: () {},
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 0.5,
                          height: 0.0,
                          color: AppColors.searchBarColor,
                        ),
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
                            ? widget.invoice!.totalItemDiscountAmount.toString()
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
      ),
    );
  }
}
