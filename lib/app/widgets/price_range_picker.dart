import 'package:flutter/material.dart';

class PriceRangePicker extends StatefulWidget {
  PriceRangePicker(
      {Key? key,
      this.maxValue = 1000000,
      this.onRangeChanged,
      required this.title,
      this.minValue = 10000})
      : super(key: key);

  final int maxValue;
  final int minValue;
  final String title;
  final void Function(int min, int max)? onRangeChanged;

  @override
  State<PriceRangePicker> createState() => _PriceRangePickerState();
}

class _PriceRangePickerState extends State<PriceRangePicker> {
  late RangeValues _values;
  @override
  void initState() {
    super.initState();
    _values = RangeValues(widget.minValue * 30, widget.maxValue * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              Text(
                  'Min:${_values.start.round()}    Max:${_values.end.round()}'),
            ],
          ),
        ),
        RangeSlider(
            divisions: widget.maxValue ~/ 10000,
            max: widget.maxValue.toDouble(),
            min: widget.minValue.toDouble(),
            // labels: RangeLabels(_values.start.round().toString(),
            //     _values.end.round().toString()),
            values: _values,
            onChanged: (v) {
              widget.onRangeChanged?.call(v.start.toInt(), v.end.toInt());
              _values = v;
              setState(() {});
            })
      ]),
    );
  }
}
