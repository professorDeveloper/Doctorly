import 'package:doctorly/core/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCircularProgressView extends StatefulWidget {
  final double radius;
  final double strokeWidth;

  LoadingCircularProgressView({
    required this.radius,
    required this.strokeWidth,
  });

  @override
  _LoadingCircularProgressViewState createState() =>
      _LoadingCircularProgressViewState();
}

class _LoadingCircularProgressViewState
    extends State<LoadingCircularProgressView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeat the animation infinitely
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.radius * 2, widget.radius * 2),
      painter: CircleProgressPainter(
        progress: _controller.value, // Use animation value as progress
        radius: widget.radius,
        strokeWidth: widget.strokeWidth,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final double radius;
  final double strokeWidth;

  CircleProgressPainter({
    required this.progress,
    required this.radius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light background color for the circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint progressPaint = Paint()
      ..color = AppColor.BlueMain // Main progress color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // Draw the background circle
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Draw the continuous progress arc (a loading loop)
    double sweepAngle = 2 * 3.141592653589793 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -3.141592653589793 / 2, // Start angle (top)
      sweepAngle, // Sweep angle depending on the progress
      false, // Do not fill the arc
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to animate the loading
  }
}