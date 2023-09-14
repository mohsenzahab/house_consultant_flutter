import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';
import 'package:mobile/app/core/theme/decorations.dart';

class GroupCheckBox<T> extends StatefulWidget {
  const GroupCheckBox(
      {Key? key,
      this.title,
      required this.items,
      required this.onChanged,
      this.decoration = const InputDecoration()})
      : super(key: key);

  final Map<T, bool> items;
  final String? title;
  final InputDecoration? decoration;
  final void Function(Map<T, bool> items) onChanged;

  @override
  State<GroupCheckBox<T>> createState() => _GroupCheckBoxState<T>();
}

class _GroupCheckBoxState<T> extends State<GroupCheckBox<T>> {
  late final Map<T, bool> values;

  @override
  void initState() {
    super.initState();
    values = Map.of(widget.items);
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
          ...values.entries.map((e) => Padding(
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
                        Checkbox(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            value: e.value,
                            onChanged: (selected) {
                              values[e.key] = selected ?? false;
                              widget.onChanged(Map.of(values));
                              setState(() {});
                            }),
                        Text(e.key.toString()),
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
