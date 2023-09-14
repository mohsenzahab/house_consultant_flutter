import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: kPaddingDefault,
        child: Text(text),
      ),
    );
  }
}
