import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LWCustomCheckBoxGroupFormField<T> extends StatefulWidget {
  final String name;
  final List<FormBuilderFieldOption<T>> options;
  final List<T>? initialValue;
  final ValueChanged<List<T>?>? onChanged;

  const LWCustomCheckBoxGroupFormField({
    Key? key,
    required this.name,
    required this.options,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _LWCustomCheckBoxGroupFormFieldState<T> createState() => _LWCustomCheckBoxGroupFormFieldState<T>();
}

class _LWCustomCheckBoxGroupFormFieldState<T> extends State<LWCustomCheckBoxGroupFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormBuilderField<List<T>>(
        initialValue: widget.initialValue ?? <T>[],
        builder: (field) {
          return Column(
            children: [
              for (final option in widget.options)
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: field.value?.contains(option.value) ?? false,
                  title: option.child,
                  onChanged: (newValue) {
                    if (newValue ?? false) {
                      var list = [...field.value!, option.value];
                      field.didChange(list);
                    } else {
                      var list = [...field.value!]..remove(option.value);
                      field.didChange(list);
                    }
                  },
                ),
            ],
          );
        },
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          border: InputBorder.none,
        ),
        name: widget.name,
      ),
    );
  }
}
