import 'package:flutter/material.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/widgets/time_painter.dart';

class PictureActions extends StatelessWidget {
  const PictureActions({
    Key? key,
    required this.property,
  }) : super(key: key);
  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          foregroundPainter: TimePainter(
              days: DateTime.now().difference(property.addedDate).inDays),
          // size: Icon(Icons.watch_later).size!,
          child: Icon(
            Icons.watch_later,
            color: Colors.transparent,
          ),
        ),
        if (property.canTakeCitizens) const Icon(Icons.badge),
        if (property.isDocReady) const Icon(Icons.list_alt_outlined),
        MIconButton(
            onPressed: () {}, icon: const Icon(Icons.stacked_line_chart_sharp)),
        if (property.isCompleted)
          const Icon(Icons.dashboard)
        else
          const Icon(Icons.dashboard_customize)
      ],
    );
  }
}

class MIconButton extends StatelessWidget {
  const MIconButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final VoidCallback onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        splashRadius: 20,
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        icon: icon);
  }
}
