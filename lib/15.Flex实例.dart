import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flex 实例')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(color: Colors.blue, height: 100),
              Expanded(child: Container(color: Colors.green)),
              Container(color: Colors.red, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
