import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
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
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('父组件', style: TextStyle(fontSize: 20, color: Colors.red)),
              Child(message: '父组件传的值'),
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String message;
  const Child({super.key, required this.message});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Text('子组件-\${widget.message}');
  }
}''',
      demoBuilder: () => Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('父组件', style: TextStyle(fontSize: 20, color: Colors.red)),
              Child(message: '父组件传的值'),
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String message;
  const Child({super.key, required this.message});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Text('子组件-${widget.message}');
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
