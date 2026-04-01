import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  print("构造函数被调用了");
  runApp(mainPage());
}

// 无状态组件 继承 StatelessWidget
class mainPage extends StatelessWidget {
  @override
  // 重写 build 方法
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text('头部区域')),
        body: Container(child: Center(
          child: GestureDetector(
            onTap: () {
              print("点击了文本");
            },
            child: Text("中部区域"),
          ),
        )),
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
        body: Container(child: Center(
          child: GestureDetector(
            onTap: () {
              print("点击了文本");
            },
            child: Text("中部区域"),
          ),
        )),
        bottomNavigationBar: Container(
          height: 50,
          child: Center(child: const Text("底部区域")),
        ),
      ),
    );
  }
}

void main() {
  print("构造函数被调用了");
  runApp(MaterialApp(
    title: "Flutter Demo",
    home: mainPage(),
  ));
}
