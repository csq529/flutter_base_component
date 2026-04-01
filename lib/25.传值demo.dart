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
            return Child(
              foodName: _list[index],
              index: index,
              delFood: (int i) {
                setState(() {
                  _list.removeAt(i);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String foodName;
  final int index;
  final Function(int index) delFood;
  const Child({
    super.key,
    required this.foodName,
    required this.index,
    required this.delFood,
  });

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(widget.foodName, style: TextStyle(color: Colors.white)),
        ),

        IconButton(
          onPressed: () {
            widget.delFood(widget.index);
          },
          color: Colors.red,
          icon: Icon(Icons.close),
        ),
      ],
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
            return Child(
              foodName: _list[index],
              index: index,
              delFood: (int i) {
                setState(() {
                  _list.removeAt(i);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final String foodName;
  final int index;
  final Function(int index) delFood;
  const Child({
    super.key,
    required this.foodName,
    required this.index,
    required this.delFood,
  });

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(widget.foodName, style: TextStyle(color: Colors.white)),
        ),

        IconButton(
          onPressed: () {
            widget.delFood(widget.index);
          },
          color: Colors.red,
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
