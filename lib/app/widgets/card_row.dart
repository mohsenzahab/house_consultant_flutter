import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';

class CardRow extends StatelessWidget {
  const CardRow(
      {Key? key,
      this.children = const <Widget>[],
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
