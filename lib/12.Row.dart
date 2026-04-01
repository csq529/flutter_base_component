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
        appBar: AppBar(title: Text('Row')),
        body: Container(
          // padding: EdgeInsets.all(20),
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.amber),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,

            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(color: Colors.blue, width: 100, height: 100),
              // SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              // SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.green,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('Row')),
        body: Container(
          // padding: EdgeInsets.all(20),
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.amber),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,

            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(color: Colors.blue, width: 100, height: 100),
              // SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              // SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.green,
                width: 100,
                height: 100,
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
