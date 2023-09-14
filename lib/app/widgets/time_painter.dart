import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimePainter extends CustomPainter {
  int days;
  TimePainter({
    required this.days,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -math.pi * 1 / 2;
    Paint paint = Paint()..color = Colors.grey.shade200;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    if (days == 0) {
      paint.color = Colors.orange;
      canvas.drawArc(
          Rect.fromCenter(
              center: size.center(Offset.zero),
              width: size.width,
              height: size.height),
          startAngle,
          2 * math.pi,
          true,
          paint);
    } else {
      paint.color = Colors.green;
      canvas.drawArc(
          Rect.fromCenter(
              center: size.center(Offset.zero),
              width: size.width,
              height: size.height),
          startAngle,
          2 * math.pi * days / 60,
          true,
          paint);
    }
  }

  @override
  bool shouldRepaint(TimePainter oldDelegate) {
    return oldDelegate.days != days;
  }
}
