import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';

class LWCustomLoginPasswordFormField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final List<String? Function(String?, String?)> validators;
  final InputDecoration? decoration;
  final bool showRequiredSymbol;
  final bool isCard;
  final bool showLabel;
  final double? height;

  const LWCustomLoginPasswordFormField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.showRequiredSymbol = true,
    this.isCard = true,
    this.showLabel = true,
    this.isRequired = false,
    this.validators = const [],
    this.decoration, this.height,
  }) : super(key: key);

  @override
  _LWCustomLoginPasswordFormFieldState createState() =>
      _LWCustomLoginPasswordFormFieldState();
}

class _LWCustomLoginPasswordFormFieldState
    extends State<LWCustomLoginPasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderTextField(
      initialValue: widget.initialValue,
      name: widget.name,
      decoration: widget.decoration ??
          InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() => obscureText = !obscureText);
              },
            ),
            errorMaxLines: 10,
            hintText: widget.hintText,
          ),
      obscureText: obscureText,
      obscuringCharacter: "*",
      validator: FormBuilderValidators.compose(
        <String? Function(String?)>[
          if (widget.isRequired)
            (value) => LWValidators.isNotNullNorEmpty(value, widget.labelText),
          (value) => LWValidators.loginPassword(value, widget.labelText),
          for (final validator in widget.validators)
            (value) => validator(value, widget.labelText),
        ],
      ),
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
