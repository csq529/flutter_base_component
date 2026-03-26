import 'package:flutter/material.dart';

void main() {
  runApp(SafeAreaWidget());
}

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(top: true, bottom: true, child: Text('安全区域组件')),
      ),
    );
  }
}
