import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class LWCustomOTPFormField extends StatelessWidget {
  final int length;

  final bool enabled;
  final String name;
  final String? labelText;
  final String? hintText;
  final bool isRequired;
  final Function(String)? onDone;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final String? initialValue;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;

  const LWCustomOTPFormField({
    Key? key,
    this.length = 6,
    this.enabled = true,
    required this.name,
    this.labelText,
    this.hintText,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.initialValue,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
    this.controller, this.onDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LWCustomFormFieldWrapper(
      labelText: labelText,
      child: FormBuilderField<String>(
        enabled: enabled,
        name: name,
        decoration: InputDecoration(
          errorMaxLines: 10,
          hintText: hintText,
          suffixIcon: const Icon(Icons.calendar_today_outlined),
        ),
        initialValue: initialValue,
        validator: FormBuilderValidators.compose(
          <String? Function(String?)>[
            if (isRequired) (value) => LWValidators.isNotNullNorEmpty(value, labelText),
            for (final validator in validators) (value) => validator(value, labelText),
          ],
        ),
        onChanged: onChanged,
        builder: (field) {
          var fieldWidth = (MediaQuery.of(context).size.width - (padding.left + padding.right)) / (length * 1.3);
          return Padding(
            padding: padding,
            child: InputDecorator(
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                errorText: field.errorText,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              child: PinCodeTextField(
                pinTextStyle: const TextStyle(
                  color: AppColors.blackColor,
                ),
                pinBoxWidth: fieldWidth,
                autofocus: false,
                maxLength: length,
                defaultBorderColor: AppColors.secondary,
                onTextChanged: onChanged,
                onDone: onDone,
                errorBorderColor: AppColors.errorColor,
                hasTextBorderColor: AppColors.primary,
                highlightColor: AppColors.dataFieldColor,
                pinBoxColor: AppColors.whiteColor,
                pinBoxRadius: 2,
                pinBoxHeight: fieldWidth,
                pinBoxBorderWidth: 2.0,
                keyboardType: TextInputType.text,
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
