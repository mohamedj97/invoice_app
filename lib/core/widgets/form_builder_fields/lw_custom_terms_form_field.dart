import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LWCustomTermsFormField extends StatelessWidget {
  final String name;

  const LWCustomTermsFormField({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: name,
      initialValue: false,
      decoration: InputDecoration(
        errorMaxLines: 10,
        filled: false,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing up you agree to our ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Terms and Conditions',
              style: TextStyle(color: Colors.blue),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {

                },
            ),
          ],
        ),
      ),
      validator: FormBuilderValidators.equal(
        context,
        errorText: 'You must accept terms and conditions to continue',
      ),
    );
  }
}
