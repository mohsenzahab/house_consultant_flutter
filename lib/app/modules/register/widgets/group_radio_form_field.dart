import 'package:flutter/material.dart';
import 'package:mobile/app/widgets/group_radio_button.dart';

class GroupRadioFormField<T> extends FormField<T> {
  GroupRadioFormField(
      {super.key,
      required List<T> options,
      super.initialValue,
      String? title,
      super.autovalidateMode,
      super.validator,
      required void Function(T newValue) onChanged})
      : super(builder: (state) {
          final InputDecoration effectiveDecoration = const InputDecoration()
              .applyDefaults(Theme.of(state.context).inputDecorationTheme);
          void onChangedHandler(T value) {
            state.didChange(value);
            onChanged(value);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GroupRadioButton<T>(
                  items: options,
                  // initialValue: initialValue,
                  title: title,
                  decoration:
                      effectiveDecoration.copyWith(errorText: state.errorText),
                  onChanged: onChangedHandler),
            ],
          );
        });
}
