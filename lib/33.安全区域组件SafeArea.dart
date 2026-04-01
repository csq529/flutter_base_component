import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

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
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(top: true, bottom: true, child: Text('安全区域组件')),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SafeAreaWidget(),
  ));
}
