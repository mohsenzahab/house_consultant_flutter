import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/theme/text_style.dart';

class CardSection extends StatelessWidget {
  const CardSection(
      {Key? key, this.title, this.padding = false, required this.children})
      : super(key: key);

  final String? title;
  final List<Widget> children;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    Widget widget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        kSpaceVertical8,
        if (title != null)
          Text(
            '  $title',
            textAlign: TextAlign.start,
            style: kTextStyleGridCardSection,
          ),
        ...children
      ],
    );
    if (padding) {
      widget = Padding(
        padding: kPaddingDefault,
        child: widget,
      );
    }
    widget = Card(
      child: widget,
    );

    return widget;
  }
}
