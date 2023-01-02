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
  final InputBorder? focusedBorderDecoration;
  final bool showRequiredSymbol;
  final double? fontSize;
  final bool isCard;
  final bool showLabel;
  final bool expands;
  final bool autoFocus;
  final double? height;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final FocusNode? focusNode;

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
    this.expands = false,
    this.controller,
    this.fontSize,
    this.onSubmitted,
    this.focusNode,
    this.onSaved,
    this.focusedBorderDecoration,
    this.contentPadding,
    this.textAlign, this.autoFocus=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderTextField(
      onSubmitted: onSubmitted,
      onSaved: onSaved,
      autofocus: autoFocus,
      initialValue: initialValue,
      focusNode: focusNode,
      textAlign: textAlign ?? TextAlign.start,
      enabled: enabled,
      controller: controller,
      name: name,
      maxLines: maxLines,
      expands: expands,
      cursorColor: AppColors.searchBarColor,
      textInputAction: textInputAction,
      style: TextStyle(
        color: enabled ? Colors.black : Colors.grey,
        fontSize: fontSize,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: borderDecoration ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.searchBarColor,
              ),
            ),
        focusedBorder: focusedBorderDecoration ??
            borderDecoration ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.searchBarColor,
              ),
            ),
        fillColor: AppColors.whiteColor,
        filled: true,
        hintText: hintText,
        alignLabelWithHint: true,
        contentPadding: contentPadding,
        hintStyle:
            TextStyle(color: AppColors.searchBarColor, fontSize: fontSize),
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
            child: Material(child: child),
          )
        : Material(child: child);
  }
}
