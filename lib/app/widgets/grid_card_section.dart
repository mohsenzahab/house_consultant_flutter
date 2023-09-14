import 'package:flutter/material.dart';
import 'package:mobile/app/widgets/card_section.dart';

class GridCardSection extends StatelessWidget {
  const GridCardSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CardSection(title: title, children: [
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        shrinkWrap: true,
        childAspectRatio: 3.0,
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        children: children,
      )
    ]);
  }
}
