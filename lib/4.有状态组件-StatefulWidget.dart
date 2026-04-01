import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "有状态组件-StatefulWidget",
      home: Scaffold(
        appBar: AppBar(title: const Text('头部区域')),
        body: Container(child: Center(child: const Text("中部区域"))),
        bottomNavigationBar: Container(
          height: 50,
          child: Center(child: const Text("底部区域")),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: const Text('头部区域')),
        body: Container(child: Center(child: const Text("中部区域"))),
        bottomNavigationBar: Container(
          height: 50,
          child: Center(child: const Text("底部区域")),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: "有状态组件-StatefulWidget",
    home: MainPage(),
  ));
}
