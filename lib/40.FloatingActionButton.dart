import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyFloatingActionButton()));
}

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              right: 50,
              child: FloatingActionButton(
                onPressed: () {
                  print('点击了...');
                },
                hoverColor: Colors.blue,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 231, 122, 158),
                shape: const CircleBorder(),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 100,
                right: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    print('点击了...');
                  },
                  hoverColor: Colors.blue,
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 231, 122, 158),
                  shape: const CircleBorder(),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyFloatingActionButton()));
}
