import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/values/values.dart';

class GroupRadioButton<T> extends StatefulWidget {
  const GroupRadioButton(
      {Key? key,
      this.title,
      required this.items,
      required this.onChanged,
      this.initialValue,
      this.decoration = const InputDecoration()})
      : super(key: key);

  final List<T> items;
  final String? title;
  final T? initialValue;
  final InputDecoration? decoration;
  final void Function(T selectedItem) onChanged;

  @override
  State<GroupRadioButton<T>> createState() => _GroupRadioButtonState<T>();
}

class _GroupRadioButtonState<T> extends State<GroupRadioButton<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  InputDecoration _getEffectiveDecoration() {
    final ThemeData themeData = Theme.of(context);
    return (widget.decoration ?? const InputDecoration())
        .applyDefaults(themeData.inputDecorationTheme)
        .copyWith(
            labelText: widget.title, contentPadding: const EdgeInsets.all(8.0));
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: _getEffectiveDecoration(),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          ...widget.items.map((e) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: kColorPrimarySwatch.shade100),
                          borderRadius:
                              BorderRadius.circular(kRadiusSmallItems))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<T>(
                            visualDensity: kVisualDensityMin,
                            value: e,
                            groupValue: selectedValue,
                            onChanged: (selected) {
                              selectedValue = selected;
                              widget.onChanged(e);
                              setState(() {});
                            }),
                        Text(e.toString()),
                      ],
                    ),
                  ),
                ),
              ))
        ].toList(),
      ),
    );
  }
}
