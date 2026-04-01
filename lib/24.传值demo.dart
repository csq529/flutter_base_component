import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _list = ['京酱肉丝', '麻婆豆腐', '宫保鸡丁', '辣子鸡丁', '烤牛排'];
  
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
  final List<String> _list = ['京酱肉丝', '麻婆豆腐', '宫保鸡丁', '辣子鸡丁', '烤牛排'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(_list.length, (index) {
            return Child(foodName: _list[index]);
          }),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String foodName;
  const Child({super.key, required this.foodName});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(widget.foodName, style: TextStyle(color: Colors.white)),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(_list.length, (index) {
            return Child(foodName: _list[index]);
          }),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String foodName;
  const Child({super.key, required this.foodName});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(widget.foodName, style: TextStyle(color: Colors.white)),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
