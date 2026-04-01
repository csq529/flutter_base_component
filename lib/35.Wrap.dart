import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(WrapWidget());
}

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.green),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.orange),
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
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.green),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WrapWidget(),
  ));
}
