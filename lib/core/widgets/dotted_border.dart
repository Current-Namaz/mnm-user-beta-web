import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  const DottedBorder({super.key, required this.child, required this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: DottedBorderPainter(color: color), child: child);
  }
}

class DottedBorderPainter extends CustomPainter {

  DottedBorderPainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5; // Width of each dash
    final double dashSpace = 5; // Space between each dash

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Draw right border
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width, startY),
        Offset(size.width, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Draw bottom border
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw left border
    startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
