import 'package:flutter/material.dart';
import 'package:mobile/app/widgets/group_checkbox.dart';

class GroupCheckboxFormField<T> extends FormField<Map<T, bool>> {
  GroupCheckboxFormField({
    super.key,
    super.autovalidateMode,
    super.validator,
    String? title,
    required Map<T, bool> options,
    required void Function(Map<T, bool> values) onChanged,
  }) : super(
            initialValue: options,
            builder: (state) {
              final InputDecoration effectiveDecoration =
                  const InputDecoration().applyDefaults(
                      Theme.of(state.context).inputDecorationTheme);
              void onChangedHandler(Map<T, bool> values) {
                state.didChange(values);
                onChanged(values);
              }

              return GroupCheckBox<T>(
                  title: title,
                  decoration:
                      effectiveDecoration.copyWith(errorText: state.errorText),
                  items: options,
                  onChanged: onChangedHandler);
            });
}
