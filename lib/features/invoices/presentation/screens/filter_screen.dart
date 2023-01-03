import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/custom_back_button.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import '../../../../core/navigation/custom_page_route.dart';
import '../../../../core/popups/error_dialogue.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../products/domain/entities/base_lookup.dart';
import '../../data/data_sources/invoices_local_data_source.dart';
import '../../data/models/requests/invoice_filter_model.dart';
import '../cubit/get_invoices/get_invoices_cubit.dart';
import '../cubit/get_types/get_invoice_types_cubit.dart';
import '../widgets/primary_and_secondary_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  final getInvoiceTypesCubit = GetInvoiceTypesCubit(sl());

  //SfRangeValues _values = const SfRangeValues(0, 10000);
  int? _value;
  List<BaseLookup> customers = [];
  List<BaseLookup> status = [];
  BaseLookup? customerValue;
  DateTime? invoiceDate;

  @override
  void initState() {
    getInvoiceTypesCubit.getInvoicesLookups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getInvoiceTypesCubit,
      child: BlocConsumer<GetInvoiceTypesCubit, GetInvoiceTypesState>(
        listener: (context, state) async {
          if (state.getInvoiceTypesRequestState == RequestState.success) {}
          if (state.getInvoiceTypesRequestState == RequestState.error) {
            getErrorDialogue(
              context: context,
              isUnAuthorized: state.getInvoiceTypesResponse!.statuscode == 401,
              message: state.getInvoiceTypesResponse?.message ?? "something_went_wrong".tr(),
            );
          }
        },
        builder: (context, state) {
          customers = state.getInvoiceTypesResponse?.result?.result.customers ?? [];
          status = state.getInvoiceTypesResponse?.result?.result.status ?? [];
          return BlocProvider.value(
            value: GetInvoicesCubit(sl(), sl()),
            child: BlocConsumer<GetInvoicesCubit, GetInvoicesState>(
              listener: (context, filterState) async {
                if (filterState.getInvoicesRequestState == RequestState.success) {
                  InvoicesLocalDataSource.status = status[_value!].name;
                  InvoicesLocalDataSource.customerName = customerValue?.name;
                  InvoicesLocalDataSource.customerId = customerValue?.id;
                  InvoicesLocalDataSource.invoiceDate = invoiceDate;

                  Navigator.of(context).pushAndRemoveUntil(
                    CustomPageRoute.createRoute(
                      page: const HomeScreen(index: 1),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
                if (filterState.getInvoicesRequestState == RequestState.error) {
                  getErrorDialogue(
                    context: context,
                    isUnAuthorized: filterState.getInvoicesResponse!.statuscode == 401,
                    message: filterState.getInvoicesResponse?.message ?? "something_went_wrong".tr(),
                  );
                }
              },
              builder: (context, filterState) {
                return CustomScaffold(
                  leading: const CustomBackButton(),
                  title: "Filter",
                  body: state is GetInvoiceTypesLoading
                      ? const Center(child: CircularProgressIndicator())
                      : FormBuilder(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 24.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(color: AppColors.searchBarColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 8.0),
                                          const LWCustomText(
                                            title: "Customer",
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                          const SizedBox(height: 16.0),
                                          DropdownButtonFormField<BaseLookup>(
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              fillColor: AppColors.labelColor,
                                              errorMaxLines: 10,
                                              hintText: "choose_customer".tr(),
                                              hintStyle: const TextStyle(color: AppColors.searchBarColor),
                                            ),
                                            value: customerValue,
                                            onChanged: (value) {
                                              setState(() {
                                                customerValue = value;
                                              });
                                            },
                                            items: customers.map((BaseLookup customer) {
                                              return DropdownMenuItem<BaseLookup>(
                                                value: customer,
                                                child: Text(
                                                  customer.name ?? "",
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
                                  ),
                                  const SizedBox(height: 32.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(color: AppColors.searchBarColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          LWCustomText(
                                            title: "Invoice Date",
                                            color: AppColors.labelColor,
                                            fontFamily: FontAssets.avertaRegular,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: LWCustomDateFormField(
                                              isRequired: false,
                                              name: "invoice_date",
                                              labelText: "",
                                              hintText: "Choose date",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(color: AppColors.searchBarColor),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: LWCustomText(
                                            title: "Status",
                                            fontSize: 14,
                                            fontFamily: FontAssets.avertaRegular,
                                            color: AppColors.labelColor,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Divider(
                                            thickness: 0.5,
                                            height: 0.0,
                                            color: AppColors.searchBarColor,
                                          ),
                                        ),
                                        const SizedBox(height: 24.0),
                                        Wrap(
                                          children: List<Widget>.generate(
                                            status.length,
                                            (int index) {
                                              return ChoiceChip(
                                                selectedColor: AppColors.primary,
                                                disabledColor: AppColors.whiteColor,
                                                backgroundColor: AppColors.whiteColor,
                                                elevation: 0.0,
                                                pressElevation: 0.0,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.zero)),
                                                label: Container(
                                                  decoration:
                                                      BoxDecoration(border: Border.all(color: AppColors.primary)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: LWCustomText(
                                                      title: status[index].name ?? "",
                                                      color: _value == index ? AppColors.whiteColor : AppColors.primary,
                                                    ),
                                                  ),
                                                ),
                                                selected: _value == index,
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    _value = selected ? index : null;
                                                  });
                                                },
                                              );
                                            },
                                          ).toList(),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: AppColors.whiteColor,
                                  //       border: Border.all(color: AppColors.searchBarColor)),
                                  //   padding:
                                  //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       const Padding(
                                  //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  //         child: LWCustomText(
                                  //           title: "Total amount",
                                  //           fontSize: 14,
                                  //           fontFamily: FontAssets.avertaRegular,
                                  //           color: AppColors.labelColor,
                                  //         ),
                                  //       ),
                                  //       const SizedBox(height: 16.0),
                                  //       const Padding(
                                  //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  //         child: Divider(
                                  //           thickness: 0.5,
                                  //           height: 0.0,
                                  //           color: AppColors.searchBarColor,
                                  //         ),
                                  //       ),
                                  //       const SizedBox(height: 52.0),
                                  //       SfRangeSlider(
                                  //         activeColor: AppColors.primary,
                                  //         inactiveColor: AppColors.searchBarColor,
                                  //         values: _values,
                                  //         // min: 0.0,
                                  //         // max: 100.0,
                                  //         min: 0,
                                  //         max: 10000,
                                  //         showLabels: false,
                                  //         //interval: 20,
                                  //         interval: 10,
                                  //         dateIntervalType: DateIntervalType.hours,
                                  //         showTicks: false,
                                  //         numberFormat: NumberFormat('\$'),
                                  //         enableTooltip: true,
                                  //         shouldAlwaysShowTooltip: true,
                                  //         onChanged: (dynamic newValues) {
                                  //           setState(
                                  //             () {
                                  //               _values = newValues;
                                  //             },
                                  //           );
                                  //         },
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              PrimaryAndSecondaryButton(
                                primaryOnPressed: () {
                                  var formState = formKey.currentState;
                                  if (formState == null) return;
                                  if (!formState.saveAndValidate()) {
                                    return;
                                  }
                                  setState(() {
                                    invoiceDate = formState.value["invoice_date"];
                                  });
                                  BlocProvider.of<GetInvoicesCubit>(context).filterInvoices(InvoiceFilterModel(
                                    invoiceDate: formState.value["invoice_date"],
                                    customerId: customerValue?.id,
                                    customerName: customerValue?.name,
                                    status: _value == null ? null : status[_value!].name,
                                  ));
                                },
                                primaryTitle: "Apply Filter",
                                secondaryOnPressed: () {
                                  setState(() {
                                    customerValue = null;
                                    formKey.currentState!.fields["invoice_date"]?.didChange(null);
                                    _value = null;
                                  });
                                },
                                secondaryTitle: "Clear",
                              ),
                            ],
                          ),
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
