import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_value_transformers.dart';

class LWCustomPhoneNumberFormField extends StatefulWidget {
  final String? initialValue;
  final bool enabled;
  final String codeName;
  final String numberName;
  final String labelText;
  final String? hintText;
  final String? prefixText;
  final bool isRequired;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;
  final int maxLines;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final bool showRequiredSymbol;
  final bool isCard;
  final bool showLabel;
  final double? height;

  const LWCustomPhoneNumberFormField({
    Key? key,
    this.initialValue,
    this.enabled = true,
    required this.codeName,
    required this.numberName,
    required this.labelText,
    this.hintText,
    this.prefixText,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
    this.showRequiredSymbol = true,
    this.isCard = true,
    this.showLabel = true,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1, this.decoration, this.height,
  }) : super(key: key);

  @override
  _LWCustomPhoneNumberFormFieldState createState() => _LWCustomPhoneNumberFormFieldState();
}

class _LWCustomPhoneNumberFormFieldState extends State<LWCustomPhoneNumberFormField> {
  TextEditingController _codeController = TextEditingController(text: "+20");

  @override
  Widget build(BuildContext context) {
    var child=Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: FormBuilderTextField(
            controller: _codeController,
            name: widget.codeName,
            enabled: false,
            decoration: widget.decoration?? InputDecoration(
              errorMaxLines: 10,
              hintText: widget.hintText,
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(width: 5.0),
        Expanded(
          flex: 4,
          child: FormBuilderTextField(
            initialValue: widget.initialValue?.replaceAll(widget.codeName, ""),
            enabled: widget.enabled,
            name: widget.numberName,
            maxLines: widget.maxLines,
            style: TextStyle(
              color: widget.enabled ? Colors.black : Colors.grey,
            ),
            decoration: widget.decoration?? InputDecoration(
              errorMaxLines: 10,
              hintText: widget.hintText,
            ),
            keyboardType: widget.keyboardType,
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose(
              <String? Function(String?)>[
                if (widget.isRequired) (value) => LWValidators.isNotNullNorEmpty(value, widget.labelText),
                    (value) =>(value !=null && value!="")?
                LWValidators.phoneNumber("${_codeController.text}${value}", widget.labelText):
                LWValidators.phoneNumber(null, widget.labelText),
                for (final validator in widget.validators) (value) => validator(value, widget.labelText),
              ],
            ),
            onChanged: widget.onChanged,
            valueTransformer: LWValueTransformers.trim,
          ),
        ),
      ],
    );
    return widget.showLabel
        ? LWCustomFormFieldWrapper(
      labelText: widget.isRequired
          ? "${widget.labelText}${widget.showRequiredSymbol ? "*" : ""}"
          : widget.labelText,
      child: widget.isCard
          ? Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(0),
          child: child)
          : SizedBox(child: child),
    )
        : widget.isCard
        ? Card(
        elevation: 4.0, margin: const EdgeInsets.all(0), child: child)
        : SizedBox(child: child);
  }
}
