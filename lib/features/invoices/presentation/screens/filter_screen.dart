import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/core/common_widgets/lw_custom_text.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_custom_date_form_field.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/widgets/form_builder_fields/lw_custom_dropdown_form_field.dart';
import '../widgets/primary_and_secondary_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SfRangeValues _values = const SfRangeValues(0, 10000);
  int? _value = 1;
  var dropdownList = [
    "1",
    "2",
    "3",
    "4",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Filter",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.searchBarColor),
            ),
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LWCustomText(
                      title: "Customer",
                      color: AppColors.labelColor,
                      fontFamily: FontAssets.avertaRegular,
                    ),
                    SizedBox(
                      width: 110.0,
                      child: Center(
                        child: LWCustomDropdownFormField<String>(
                          name: "choose_customer",
                          showLabel: false,
                          labelText: "",
                          hintText: "Choose customer",
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
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.searchBarColor),
            ),
            child:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                       LWCustomText(
                        title: "Date",
                        color: AppColors.labelColor,
                        fontFamily: FontAssets.avertaRegular,
                      ),
                      SizedBox(
                        width: 110.0,
                        child: Center(
                          child: LWCustomDateFormField(name: "date", labelText: "choose date",hintText: "Choose date",),
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
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.searchBarColor),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: LWCustomText(
                    title: "Statues",
                    fontSize: 14,
                    fontFamily: FontAssets.avertaRegular,
                    color: AppColors.labelColor,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                const SizedBox(height: 24.0),
                Wrap(
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return ChoiceChip(
                        selectedColor: AppColors.primary,
                        disabledColor: AppColors.whiteColor,
                        backgroundColor: AppColors.whiteColor,
                        elevation: 0.0,
                        pressElevation: 0.0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                        label: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LWCustomText(
                              title: 'Approved',
                              color: _value == index
                                  ? AppColors.whiteColor
                                  : AppColors.primary,
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
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.searchBarColor)),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: LWCustomText(
                    title: "Total amount",
                    fontSize: 14,
                    fontFamily: FontAssets.avertaRegular,
                    color: AppColors.labelColor,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.0,
                    color: AppColors.searchBarColor,
                  ),
                ),
                const SizedBox(height: 52.0),
                SfRangeSlider(
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.searchBarColor,
                  values: _values,
                  // min: 0.0,
                  // max: 100.0,
                  min: 0,
                  max: 10000,
                  showLabels: false,
                  //interval: 20,
                  interval: 10,
                  dateIntervalType: DateIntervalType.hours,
                  showTicks: false,
                  numberFormat: NumberFormat('\$'),
                  enableTooltip: true,
                  shouldAlwaysShowTooltip: true,
                  onChanged: (dynamic newValues) {
                    setState(
                      () {
                        _values = newValues;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          PrimaryAndSecondaryButton(
            primaryOnPressed: () {},
            primaryTitle: "Apply Filter",
            secondaryOnPressed: () {},
            secondaryTitle: "Clear",
          ),
        ],
      ),
    );
  }
}
