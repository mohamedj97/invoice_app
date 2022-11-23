import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_value_transformers.dart';

class LWCustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;
  final int maxLines;
  final TextInputType keyboardType;
  final InputBorder? borderDecoration;
  final bool showRequiredSymbol;
  final double? fontSize;
  final bool isCard;
  final bool showLabel;
  final bool expands;
  final double? height;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  const LWCustomTextFormField({
    Key? key,
    this.initialValue,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
    this.showRequiredSymbol = true,
    this.maxLines = 1,
    this.borderDecoration,
    this.isCard = true,
    this.showLabel = true,
    this.keyboardType = TextInputType.text,
    this.height,
    this.textInputAction,
    this.expands = false, this.controller, this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderTextField(
      initialValue: initialValue,
      enabled: enabled,
      controller: controller,
      name: name,
      maxLines: maxLines,
      expands: expands,
      cursorColor: AppColors.searchBarColor,
      textInputAction: textInputAction,
      style: TextStyle(
        color: enabled ? Colors.black : Colors.grey,fontSize: fontSize,
      ),
      keyboardType: keyboardType,
      decoration:
          InputDecoration(
            enabledBorder: borderDecoration ?? const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.searchBarColor,
              ),
            ),
            focusedBorder: borderDecoration ?? const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.searchBarColor,
              ),
            ),
            fillColor: AppColors.whiteColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.searchBarColor,fontSize: fontSize),
          ),
      validator: FormBuilderValidators.compose(
        <String? Function(String?)>[
          if (isRequired)
            (value) => LWValidators.isNotNullNorEmpty(value, labelText),
          for (final validator in validators)
            (value) => validator(value, labelText),
        ],
      ),
      onChanged: onChanged,
      valueTransformer: LWValueTransformers.trim,
    );
    return showLabel
        ? LWCustomFormFieldWrapper(
            labelText: isRequired
                ? "$labelText${showRequiredSymbol ? "*" : ""}"
                : labelText,
            child: isCard
                ? Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.all(0),
                    child: child)
                : SizedBox(child: child),
          )
        : isCard
            ? Card(
                elevation: 4.0, margin: const EdgeInsets.all(0), child: child)
            : SizedBox(child: child);
  }
}
