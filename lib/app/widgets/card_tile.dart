import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';
import 'package:mobile/app/core/theme/decorations.dart';

class CardTile extends StatelessWidget {
  const CardTile(
      {Key? key,
      this.onTap,
      this.trailing,
      this.title,
      this.leading,
      this.subtitle,
      this.selected})
      : super(key: key);

  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final Widget? subtitle;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    // final shape = RoundedRectangleBorder(borderRadius: kBorderRadiusDefault);
    return Card(
      child: ListTile(
        selected: selected ?? false,
        selectedTileColor: kColorPrimarySwatch.shade100,
        selectedColor: Colors.black,
        shape: CardTheme.of(context).shape,
        leading: leading,
        title: title,
        trailing: trailing,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}
