import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/*
  CustomPaint 是一个 Flutter 组件，它允许你在屏幕上绘制自定义的图形和效果。CustomPaint 的主要作用是提供一个画布（Canvas）和一个绘制器（Painter），你可以在绘制器中使用 Canvas API 来绘制各种形状、路径、文本等，从而实现丰富的视觉效果。
  CustomPaint 的常见用法包括：
- 绘制基本形状：你可以使用 Canvas 的 drawCircle、drawRect、drawLine 等方法来绘制圆形、矩形、线条等基本图形。
- 绘制图片：你可以使用 Canvas 的 drawImage、drawImageRect 等方法来绘制图片。
- 绘制路径：你可以使用 Canvas 的 drawPath 方法来绘制路径，路径可以由多个点组成，这些点可以连接起来形成一条路径。
- 绘制文本：你可以使用 Canvas 的 drawText 方法来绘制文本。
- 绘制动画：你可以使用 AnimatedWidget、AnimatedBuilder、TweenAnimationBuilder 等来创建动画。


*/

class MyCustomPaint extends StatefulWidget {
  const MyCustomPaint({super.key});

  @override
  State<MyCustomPaint> createState() => _MyCustomPaintState();
}

class _MyCustomPaintState extends State<MyCustomPaint> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'dart:math' as math;

import 'package:flutter/material.dart';

/*
  CustomPaint 是一个 Flutter 组件，它允许你在屏幕上绘制自定义的图形和效果。CustomPaint 的主要作用是提供一个画布（Canvas）和一个绘制器（Painter），你可以在绘制器中使用 Canvas API 来绘制各种形状、路径、文本等，从而实现丰富的视觉效果。
  CustomPaint 的常见用法包括：
- 绘制基本形状：你可以使用 Canvas 的 drawCircle、drawRect、drawLine 等方法来绘制圆形、矩形、线条等基本图形。
- 绘制图片：你可以使用 Canvas 的 drawImage、drawImageRect 等方法来绘制图片。
- 绘制路径：你可以使用 Canvas 的 drawPath 方法来绘制路径，路径可以由多个点组成，这些点可以连接起来形成一条路径。
- 绘制文本：你可以使用 Canvas 的 drawText 方法来绘制文本。
- 绘制动画：你可以使用 AnimatedWidget、AnimatedBuilder、TweenAnimationBuilder 等来创建动画。


*/

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

void main() {
  runApp(const MaterialApp(home: MyCustomPaint()));
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: Center(child: CustomPaint(painter: MyPainter())),
        ),
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

void main() {
  runApp(const MaterialApp(home: MyCustomPaint()));
}
