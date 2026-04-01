import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({super.key});

  Future<String> fetchData() {
    return Future.delayed(const Duration(seconds: 2), () => '数据加载完成');
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FutureBuilderWidget()));
}

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({super.key});

  Future<String> fetchData() {
    return Future.delayed(const Duration(seconds: 2), () => '数据加载完成');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('错误: \${snapshot.error}');
            } else {
              return Text(snapshot.data ?? '无数据');
            }
          },
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: Center(
          child: FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('错误: ${snapshot.error}');
              } else {
                return Text(snapshot.data ?? '无数据');
              }
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: FutureBuilderWidget()));
}
