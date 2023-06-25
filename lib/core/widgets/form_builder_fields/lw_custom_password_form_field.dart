import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/assets/colors.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/lw_validators.dart';

class LWCustomPasswordFormField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final List<String? Function(String?, String?)> validators;
  final InputDecoration? decoration;
  final bool showRequiredSymbol;
  final FocusNode? focusNode;
  final bool showLabel;
  final double? height;
  final void Function(String?)? onSaved;
  final void Function(String?)? onSubmitted;
  final bool? readOnly;

  const LWCustomPasswordFormField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.controller,
    this.showRequiredSymbol = true,
    this.showLabel = true,
    this.validators = const [],
    this.decoration,
    this.height, this.onSaved, this.onSubmitted, this.readOnly, this.focusNode,
  }) : super(key: key);

  @override
  _LWCustomPasswordFormFieldState createState() =>
      _LWCustomPasswordFormFieldState();
}

class _LWCustomPasswordFormFieldState extends State<LWCustomPasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var child = FormBuilderTextField(
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly??false,
      name: widget.name,
      controller: widget.controller,
      decoration: widget.decoration ??
          InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.dataFieldColor, width: 1.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.dataFieldBorderColor, width: 0.5),
            ),
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
          (value) => LWValidators.password(value, widget.labelText),
          for (final validator in widget.validators)
            (value) => validator(value, widget.labelText),
        ],
      ),
    );
    return widget.showLabel
        ? Material(
            color: Colors.transparent,
            child: LWCustomFormFieldWrapper(
              labelText: widget.isRequired
                  ? "${widget.labelText}${widget.showRequiredSymbol ? "*" : ""}"
                  : widget.labelText,
              child: child,
            ),
          )
        : Material(color: Colors.transparent, child: child);
  }
}
