import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';

import '../../assets/colors.dart';


class LWCustomDateFormField extends StatelessWidget {
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;

  final DateTime? firstDate, lastDate;
  final bool Function(DateTime)? selectableDayPredicate;
  final DateTime? initialValue;
  final List<String? Function(DateTime?, String?)> validators;
  final ValueChanged<DateTime?>? onChanged;

  const LWCustomDateFormField({
    Key? key,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.firstDate,
    this.lastDate,
    this.selectableDayPredicate,
    this.initialValue,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      enabled: enabled,
      name: name,
      decoration: InputDecoration(
        errorMaxLines: 10,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.searchBarColor),
        suffixIcon: const Icon(Icons.calendar_month),
      ),
      format: DateFormat("dd/MM/yyyy"),
      inputType: InputType.date,
      firstDate: firstDate,
      lastDate: lastDate,
      selectableDayPredicate: selectableDayPredicate,
      initialValue: initialValue,
      validator: FormBuilderValidators.compose(
        <String? Function(DateTime?)>[
          if (isRequired) (value) => LWValidators.required(value, labelText),
          for (final validator in validators) (value) => validator(value, labelText),
        ],
      ),
      onChanged: onChanged,
    );
  }
}
