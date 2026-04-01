import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  Widget buildMyContainer(Color _color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: _color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: OpacityWidget()));
}

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  Widget buildMyContainer(Color _color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: _color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: buildMyContainer(Colors.blue),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      child: Opacity(
                        opacity: 0.5,
                        child: buildMyContainer(Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: buildMyContainer(Colors.blue),
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        child: Opacity(
                          opacity: 0.5,
                          child: buildMyContainer(Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: OpacityWidget()));
}
