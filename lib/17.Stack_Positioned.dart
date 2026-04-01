import 'dart:collection';

import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'dart:collection';

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
        appBar: AppBar(title: Text('Stack')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,

          // Stack 堆叠 基础用法
          // child: Stack(
          //   // alignment: Alignment.center,
          //   children: [
          //     Container(color: Colors.blue, width: 300, height: 300),
          //     Container(color: Colors.red, width: 200, height: 200),
          //     Container(color: Colors.amber, width: 100, height: 100),
          //   ],
          // ),
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.grey),

              Positioned(
                left: 20,
                top: 20,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(width: 100, height: 100, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('Stack')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,

          // Stack 堆叠 基础用法
          // child: Stack(
          //   // alignment: Alignment.center,
          //   children: [
          //     Container(color: Colors.blue, width: 300, height: 300),
          //     Container(color: Colors.red, width: 200, height: 200),
          //     Container(color: Colors.amber, width: 100, height: 100),
          //   ],
          // ),
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.grey),

              Positioned(
                left: 20,
                top: 20,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(width: 100, height: 100, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
