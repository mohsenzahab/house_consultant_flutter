import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';

class DropDownPicker<T> extends StatefulWidget {
  const DropDownPicker({
    Key? key,
    required this.items,
    required this.onItemSelected,
    this.hint,
    this.joinItemsWithHint = false,
    this.value,
    this.validator,
  }) : super(key: key);

  final void Function(T? selectedItem) onItemSelected;
  final List<T> items;
  final String? hint;
  final bool joinItemsWithHint;
  final T? value;
  final FormFieldValidator<T>? validator;

  @override
  State<DropDownPicker<T>> createState() => _DropDownPickerState<T>();
}

class _DropDownPickerState<T> extends State<DropDownPicker<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  void didUpdateWidget(DropDownPicker<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedItem = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('DropDownPicker built');
    final String hint = widget.hint ?? '';
    return DropdownButtonFormField<T>(
        validator: widget.validator,
        decoration: kDecorationDropDownPicker.copyWith(
            enabled: widget.items.isEmpty ? false : true,
            labelText:
                widget.joinItemsWithHint || _selectedItem != null ? hint : null,
            hintText: widget.joinItemsWithHint ? widget.items.join('/') : hint),
        isExpanded: true,
        borderRadius: BorderRadius.circular(kRadiusSmallItems),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        iconSize: 0,
        value: _selectedItem,
        items: widget.items
            .map((e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(e.toString(), textAlign: TextAlign.center),
                ))
            .toList(),
        onChanged: (item) {
          setState(() {
            _selectedItem = item;
            widget.onItemSelected(item);
          });
        });
  }
}
