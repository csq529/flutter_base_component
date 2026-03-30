import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyAbsorbPointer()));
}

class MyAbsorbPointer extends StatefulWidget {
  const MyAbsorbPointer({super.key});

  @override
  State<MyAbsorbPointer> createState() => _MyAbsorbPointerState();
}

class _MyAbsorbPointerState extends State<MyAbsorbPointer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AbsorbPointer(
            absorbing: true, // 禁用点击
            child: ElevatedButton(
              onPressed: () {
                print('点击了按钮');
              },
              child: const Text('点击按钮'),
            ),
          ),
        ),
      )
    );
  }
}