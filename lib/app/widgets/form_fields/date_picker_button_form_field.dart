import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerButtonFormField extends FormField<DateTime> {
  DatePickerButtonFormField({
    super.key,
    super.autovalidateMode,
    super.validator,
    super.initialValue,
    void Function(DateTime? date)? onChanged,
    String? title,
  }) : super(
          builder: (state) {
            final InputDecoration effectiveDecoration = InputDecoration(
              labelText: title,
              // hintText: 'hint',
              // floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.zero,
            ).applyDefaults(Theme.of(state.context).inputDecorationTheme);
            String formattedDate(DateTime? value) =>
                value == null ? 'Pick a date' : DateFormat.yMd().format(value);
            return InkWell(
              onTap: () {
                final today = DateUtils.dateOnly(DateTime.now());
                showDatePicker(
                        context: state.context,
                        initialDate: today,
                        firstDate:
                            today.subtract(const Duration(days: 365 * 100)),
                        lastDate: today)
                    .then((value) {
                  state.didChange(value);
                  onChanged?.call(value);
                });
              },
              child: InputDecorator(
                decoration:
                    effectiveDecoration.copyWith(errorText: state.errorText),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(formattedDate(state.value)),
                    const Icon(Icons.calendar_month)
                  ],
                ),
              ),
            );
          },
        );
}
