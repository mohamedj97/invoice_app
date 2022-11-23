import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_app/core/assets/colors.dart';

class LWCustomMultiSelectFormField<T> extends StatefulWidget {
  final Widget hintWidget;
  final bool required;
  final List<T> items;
  final String Function(T) labelBuilder;
  final String name;
  final List<String? Function(String?, String?)> validator;
  final ValueChanged<List<T>?>? onSaved;
  final Color? fillColor;
  final InputBorder? border;
  final Color? chipBackGroundColor;
  final ShapeBorder dialogShapeBorder;
  final Color? checkBoxCheckColor;
  final Color? checkBoxActiveColor;
  final bool enabled;
  final void Function()? onItemPressed;
  final List<T>? initialValue;

  const LWCustomMultiSelectFormField({
    Key? key,
    required this.hintWidget,
    this.required = false,
    required this.items,
    required this.labelBuilder,
    this.dialogShapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    this.fillColor,
    this.border,
    this.chipBackGroundColor = Colors.white,
    this.checkBoxCheckColor = Colors.white,
    this.checkBoxActiveColor = AppColors.primary,
    this.enabled = true,
    this.onItemPressed,
    required this.validator,
    this.onSaved,
    this.initialValue,
    required this.name,
  }) : super(key: key);

  @override
  _LWCustomMultiSelectFormFieldState<T> createState() => _LWCustomMultiSelectFormFieldState<T>();
}

class _LWCustomMultiSelectFormFieldState<T> extends State<LWCustomMultiSelectFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<T>>(
      name: widget.name,
      builder: (field) {
        return InkWell(
          onTap: !widget.enabled
              ? null
              : () async {
                  List<T>? initialSelected = field.value;
                  initialSelected ??= <T>[];
                  final items = <MultiSelectDialogItem<T>>[
                    for (var item in widget.items) MultiSelectDialogItem<T>(item, widget.labelBuilder(item)),
                  ];
                  List<T>? selectedValues = await showDialog<List<T>>(
                    context: context,
                    builder: (BuildContext context) {
                      return MultiSelectDialog<T>(
                        okButtonLabel: "OK",
                        cancelButtonLabel: "CANCEL",
                        items: items,
                        initialSelectedValues: initialSelected,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        dialogShapeBorder: widget.dialogShapeBorder,
                        checkBoxActiveColor: widget.checkBoxActiveColor,
                        checkBoxCheckColor: widget.checkBoxCheckColor,
                      );
                    },
                  );

                  if (selectedValues != null) {
                    field.didChange(selectedValues);
                  }
                },
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              errorMaxLines: 4,
              fillColor: widget.fillColor ?? Theme.of(context).canvasColor,
              border: widget.border ?? const UnderlineInputBorder(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (field.value?.isNotEmpty ?? false)
                        ? Expanded(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 10.0,
                              children: [
                                for (var item in field.value!)
                                  InkWell(
                                    key: ValueKey(item),
                                    onTap: () {
                                      setState(() {
                                        field.value!.remove(item);
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Theme.of(context).primaryColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                widget.labelBuilder(item),
                                                style: TextStyle(color: Colors.grey[700]),
                                              ),
                                              const SizedBox(width: 10.0),
                                              const Icon(Icons.close, size: 10),
                                              const SizedBox(width: 5.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          )
                        :  Container(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: widget.hintWidget,
                          ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black87,
                      size: 25.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      initialValue: widget.initialValue ?? <T>[],
    );
  }
}

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String? label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  final List<MultiSelectDialogItem<V>>? items;
  final List<V>? initialSelectedValues;
  final Widget? title;
  final String? okButtonLabel;
  final String? cancelButtonLabel;
  final TextStyle labelStyle;
  final ShapeBorder? dialogShapeBorder;
  final Color? checkBoxCheckColor;
  final Color? checkBoxActiveColor;

  const MultiSelectDialog(
      {Key? key,
      this.items,
      this.initialSelectedValues,
      this.title,
      this.okButtonLabel,
      this.cancelButtonLabel,
      this.labelStyle = const TextStyle(),
      this.dialogShapeBorder,
      this.checkBoxActiveColor,
      this.checkBoxCheckColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = <V>[];

  @override
  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues!);
    }
  }

  void _onItemCheckedChange(V itemValue, bool? checked) {
    setState(() {
      if (checked!) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      shape: widget.dialogShapeBorder,
      contentPadding: const EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: const EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items!.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: _onCancelTap,
          child: Text(widget.cancelButtonLabel!),
        ),
        TextButton(
          onPressed: _onSubmitTap,
          child: Text(widget.okButtonLabel!),
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      checkColor: widget.checkBoxCheckColor,
      activeColor: widget.checkBoxActiveColor,
      title: Text(
        item.label!,
        style: widget.labelStyle,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}
