import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyTable()));
}

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [const Text('姓名', style: TextStyle()), const Text('年龄'), const Text('性别')],
            ),
            TableRow(
              children: [const Text('张三'), const Text('18'), const Text('男')],
            ),
          ],
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [const Text('姓名', style: TextStyle()), const Text('年龄'), const Text('性别')],
              ),
              TableRow(
                children: [const Text('张三'), const Text('18'), const Text('男')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyTable()));
}
