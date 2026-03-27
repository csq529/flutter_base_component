import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyCustomPaint()));
}

class MyCustomPaint extends StatefulWidget {
  const MyCustomPaint({super.key});

  @override
  State<MyCustomPaint> createState() => _MyCustomPaintState();
}

class _MyCustomPaintState extends State<MyCustomPaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: CustomPaint(painter: MyPainter())),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);

    // canvas.drawLine(
    //     Offset(size.width / 2, size.height / 2),
    //     Offset(size.width / 2, size.height / 2 + 100),
    //     paint);

    // canvas.drawRect(
    //     Rect.fromCenter(
    //         center: Offset(size.width / 2, size.height / 2),
    //         width: 100,
    //         height: 100),
    //     paint);

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //         Rect.fromCenter(
    //             center: Offset(size.width / 2, size.height / 2),
    //             width: 100,
    //             height: 100),
    //         const Radius.circular(20)),
    //     paint);

    // canvas.drawOval(
    //     Rect.fromCenter(
    //         center: Offset(size.width / 2, size.height / 2),
    //         width: 100,
    //         height: 100),
    //     paint);


    // final path = Path()
    //   ..moveTo(size.width / 2, size.height / 2)
    //   ..lineTo(size.width / 2, size.height / 2 + 100)
    //   ..lineTo(size.width / 2 + 100, size.height / 2 + 100)
    //   ..lineTo(size.width / 2 + 100, size.height / 2);

    // canvas.drawPath(path, paint);

    // 定义 drawArc 所需的参数
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 200,
      height: 200,
    );
    final double startAngle = math.pi / 2; // 90 度 
    final sweepAngle = 3 * math.pi / 4; // 绘制半圆  135 度
    final useCenter = false; // false 为弧线，true 为扇形

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
