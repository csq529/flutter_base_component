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
        appBar: AppBar(
          title: Text("Padding"),
        ),
        body: Container(
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.amber),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            // padding: EdgeInsets.only(left: 20, bottom: 20),
            // padding: EdgeInsets.all(20),
            child: Container(color: Colors.blue)
          ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(
          title: Text("Padding"),
        ),
        body: Container(
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.amber),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            // padding: EdgeInsets.only(left: 20, bottom: 20),
            // padding: EdgeInsets.all(20),
            child: Container(color: Colors.blue)
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
