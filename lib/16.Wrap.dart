import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(color: Colors.blue, width: 100, height: 100);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Wrap')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: getList(),
          ),
        ),
      ),
    );
  }
}
