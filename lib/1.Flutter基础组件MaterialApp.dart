import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MaterialAppDemo extends StatelessWidget {
  const MaterialAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
    home: Scaffold()
  ));
}''',
      demoBuilder: () => Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'MaterialApp 演示',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
    home: const MaterialAppDemo()
  ));
}
