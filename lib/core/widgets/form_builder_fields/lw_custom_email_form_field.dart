import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/assets/font_assets.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_value_transformers.dart';

class LWCustomEmailFormField extends StatelessWidget {
  final String? initialValue;
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final ValueChanged<String?>? onChanged;
  final int maxLines;
  final InputDecoration? decoration;
  final bool showRequiredSymbol;
  final bool showLabel;
  final void Function(String?)? onSaved;
  final void Function(String?)? onSubmitted;

  const LWCustomEmailFormField({
    Key? key,
    this.initialValue,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.onChanged,
    this.showRequiredSymbol = true,
    this.maxLines = 1,
    this.decoration,
    this.showLabel = true,
    this.onSaved,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderTextField(
      initialValue: initialValue,
      enabled: enabled,
      name: name,
      onSaved: onSaved,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppColors.dataFieldColor,
        fontFamily: FontAssets.avertaSemiBold,
      ),
      decoration: decoration ??
          InputDecoration(
            errorMaxLines: 10,
            hintText: hintText,
            focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.dataFieldColor, width: 1.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.dataFieldBorderColor, width: 0.5),
            ),
          ),
      validator: FormBuilderValidators.compose(
        <String? Function(String?)>[
          if (isRequired)
            (value) => LWValidators.isNotNullNorEmpty(value, labelText),
          (value) => LWValidators.email(value, labelText),
        ],
      ),
      onChanged: onChanged,
      valueTransformer: LWValueTransformers.trimToLowerCase,
    );
    return showLabel
        ? Material(
            color: Colors.transparent,
            child: LWCustomFormFieldWrapper(
                labelText: isRequired
                    ? "$labelText${showRequiredSymbol ? "*" : ""}"
                    : labelText,
                child: child),
          )
        : Material(color: Colors.transparent, child: child);
  }
}
