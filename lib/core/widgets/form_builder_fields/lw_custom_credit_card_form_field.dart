import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_app/core/widgets/form_builder_fields/common/lw_custom_form_field_wrapper.dart';

import 'lw_validators.dart';

class LWCustomExpireDateFormField extends StatelessWidget {
  final bool enabled;
  final String name;
  final String labelText;
  final String hintText;
  final bool isRequired;
  final bool? isNumbered;
  final bool? isExpired;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;

  const LWCustomExpireDateFormField({
    Key? key,
    this.enabled = true,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
    this.isNumbered = false,
    this.isExpired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LWCustomFormFieldWrapper(
      labelText: isRequired ? "$labelText*" : labelText,
      child: FormBuilderTextField(
        enabled: enabled,
        controller: MaskedTextController(mask: "00/00"),
        name: name,
        keyboardType: isNumbered! ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          errorMaxLines: 10,
          hintText: hintText,
        ),
        // valueTransformer: (text) => num.tryParse(text),
        validator: FormBuilderValidators.compose(
          <String? Function(String?)>[
            if (isRequired) (value) => LWValidators.isNotNullNorEmpty(value, labelText),
            for (final validator in validators) (value) => validator(value, labelText),
          ],
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class MaskedTextController extends TextEditingController {
  MaskedTextController({String? text, required this.mask, Map<String, RegExp>? translator}) : super(text: text) {
    this.translator = translator ?? MaskedTextController.getDefaultTranslator();

    addListener(() {
      final String previous = _lastUpdatedText;
      if (beforeChange(previous, this.text)) {
        updateText(this.text);
        afterChange(previous, this.text);
      } else {
        updateText(_lastUpdatedText);
      }
    });

    updateText(this.text);
  }

  String mask;

  late Map<String, RegExp> translator;

  Function afterChange = (String previous, String next) {};
  Function beforeChange = (String previous, String next) {
    return true;
  };

  String _lastUpdatedText = '';

  void updateText(String text) {
    if (text.isNotEmpty) {
      this.text = _applyMask(mask, text);
    } else {
      this.text = '';
    }

    _lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    updateText(text);

    if (!moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    final String text = _lastUpdatedText;
    selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  @override
  set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      moveCursorToEnd();
    }
  }

  static Map<String, RegExp> getDefaultTranslator() {
    return <String, RegExp>{
      'A': RegExp(r'[A-Za-z]'),
      '0': RegExp(r'[0-9]'),
      '@': RegExp(r'[A-Za-z0-9]'),
      '*': RegExp(r'.*')
    };
  }

  String _applyMask(String? mask, String value) {
    String result = '';

    int maskCharIndex = 0;
    int valueCharIndex = 0;

    while (true) {
      // if mask is ended, break.
      if (maskCharIndex == mask!.length) {
        break;
      }

      // if value is ended, break.
      if (valueCharIndex == value.length) {
        break;
      }

      final String maskChar = mask[maskCharIndex];
      final String valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
        continue;
      }

      // apply translator if match
      if (translator.containsKey(maskChar)) {
        if (translator[maskChar]!.hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
        continue;
      }

      // not masked value, fixed char on mask
      result += maskChar;
      maskCharIndex += 1;
      continue;
    }

    return result;
  }
}
