import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';

class LWCustomDropdownFormField<T> extends StatelessWidget {
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final List<String? Function(T?, String?)> validators;
  final T? initialValue;
  final Color? fillColor;
  final List<T> items;
  final bool showRequiredSymbol;
  final bool isCard;
  final bool showLabel;
  final Color? iconColor;
  final InputBorder? border;
  final Widget Function(BuildContext, T) itemBuilder;
  final ValueChanged<T?>? onChanged;

  const LWCustomDropdownFormField({
    Key? key,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.initialValue,
    required this.items,
    required this.itemBuilder,
    this.onChanged,
    this.showRequiredSymbol = true,
    this.isCard = true,
    this.showLabel = true,
    this.validators = const [],
    this.fillColor,
    this.iconColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderDropdown<T>(
      iconEnabledColor: iconColor ?? Colors.transparent,
      name: name,
      enabled: enabled,
      icon: null,
      elevation: 0,
      decoration: InputDecoration(
        enabledBorder: border ?? InputBorder.none,
        focusedBorder: border ?? InputBorder.none,
        fillColor: fillColor,
        errorMaxLines: 10,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.searchBarColor),
      ),
      items: <DropdownMenuItem<T>>[
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: itemBuilder(context, item),
          ),
      ],
      initialValue: initialValue,
      onChanged: enabled ? onChanged : null,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (T? value) {
        var validatorsList = <String? Function(T?)>[
          if (isRequired) (value) => LWValidators.required(value, labelText),
          for (final validator in validators)
            (value) => validator(value, labelText),
        ];
        for (var validator in validatorsList) {
          var validationResult = validator(value);
          if (validationResult != null) {
            return validationResult;
          }
        }
        return null;
      },
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
