/*
 * @Author: cui
 * @Date: 2026-02-28 17:28:21
 * @LastEditors: cui
 * @LastEditTime: 2026-03-31 15:48:38
 * @FilePath: /flutter_base_component/lib/9.Center.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // alignment: Alignment.center,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(width: 2, color: Colors.blueAccent),
            ),
            child: Center(
              child: Text('居中组件', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: Center(
          child: Container(
            // alignment: Alignment.center,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(width: 2, color: Colors.blueAccent),
            ),
            child: Center(
              child: Text('居中组件', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MainPage()));
}
