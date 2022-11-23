import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';

class LWCustomDateRangeFormField extends StatelessWidget {
  final String name;
  final String? labelText;
  final DateTime firstDate, lastDate;
  final String? hintText;

  final DateTimeRange? initialValue;

  const LWCustomDateRangeFormField({
    Key? key,
    required this.name,
    this.labelText,
    required this.firstDate,
    required this.lastDate,
    this.initialValue,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LWCustomFormFieldWrapper(
      labelText: labelText,
      child: FormBuilderDateRangePicker(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconConstraints: BoxConstraints.tight(
            const Size(35.0, 35.0),
          ),
          suffixIcon: const Center(
            child: Icon(Icons.add),
          ),
          errorMaxLines: 10,
        ),
        name: name,
        initialValue: initialValue,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
    );
  }
}
