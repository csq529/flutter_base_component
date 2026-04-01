import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MyFadeIn extends StatefulWidget {
  const MyFadeIn({super.key});

  @override
  State<MyFadeIn> createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // 定义动画时长常量
  static const _animationDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 重置动画方法
  void _resetAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyFadeIn()));
}

class MyFadeIn extends StatefulWidget {
  const MyFadeIn({super.key});

  @override
  State<MyFadeIn> createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // 定义动画时长常量
  static const _animationDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 重置动画方法
  void _resetAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _resetAnimation,
              icon: const Icon(Icons.refresh),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animation,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''',
      demoBuilder: () => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _resetAnimation,
                icon: const Icon(Icons.refresh),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _animation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyFadeIn()));
}
