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
        appBar: AppBar(title: Text('Text')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,

          child: Text.rich(
            TextSpan(
              text: 'Hello',
              children: [
                TextSpan(
                  text: ' Flutter',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(color: Colors.green),
                ),
              ],
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
          ),

          // child: Text(
          //   'Hello Flutter!',
          //   style: TextStyle(
          //     fontSize: 50,
          //     color: Colors.blue,
          //     decoration: TextDecoration.underline,
          //     fontWeight: FontWeight.w900,
          //     fontStyle: FontStyle.italic,
          //     decorationColor: Colors.purple
          //   ),
          // ),

          // child: Text(
          //   '今天天气不错，今天天气不错，今天天气不错，今天天气不错，今天天气不错，今天天气不错，',
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: Colors.blue,
          //     decoration: TextDecoration.underline,
          //     fontWeight: FontWeight.w900,
          //     fontStyle: FontStyle.italic,
          //     decorationColor: Colors.purple,
          //   ),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('Text')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,

          child: Text.rich(
            TextSpan(
              text: 'Hello',
              children: [
                TextSpan(
                  text: ' Flutter',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(color: Colors.green),
                ),
              ],
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
          ),

          // child: Text(
          //   'Hello Flutter!',
          //   style: TextStyle(
          //     fontSize: 50,
          //     color: Colors.blue,
          //     decoration: TextDecoration.underline,
          //     fontWeight: FontWeight.w900,
          //     fontStyle: FontStyle.italic,
          //     decorationColor: Colors.purple
          //   ),
          // ),

          // child: Text(
          //   '今天天气不错，今天天气不错，今天天气不错，今天天气不错，今天天气不错，今天天气不错，',
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: Colors.blue,
          //     decoration: TextDecoration.underline,
          //     fontWeight: FontWeight.w900,
          //     fontStyle: FontStyle.italic,
          //     decorationColor: Colors.purple,
          //   ),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
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
