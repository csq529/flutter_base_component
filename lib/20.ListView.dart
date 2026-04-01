import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView')),
        // ListView.separated 用法 itemBuilder 构建列表项，separatorBuilder 构建分割线，itemCount 列表项数量
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                '我是第\${index + 1}个',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              color: Colors.amber
            );
          },
          itemCount: 100,
        ),

        // ListView.builder 用法 itemBuilder 构建列表项，itemCount 列表项数量
        // body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       height: 50,
        //       margin: EdgeInsets.only(bottom: 10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text(
        //         '我是第\${index + 1}个',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   },
        // ),

        // 基础用法
        // body: ListView(
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       height: 50,
        //       margin: EdgeInsets.only(bottom: 10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text('我是第\${index + 1}个', style: TextStyle(color: Colors.white)),
        //     );
        //   }),
        // ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('ListView')),
        // ListView.separated 用法 itemBuilder 构建列表项，separatorBuilder 构建分割线，itemCount 列表项数量
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                '我是第${index + 1}个',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              color: Colors.amber
            );
          },
          itemCount: 100,
        ),

        // ListView.builder 用法 itemBuilder 构建列表项，itemCount 列表项数量
        // body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       height: 50,
        //       margin: EdgeInsets.only(bottom: 10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text(
        //         '我是第${index + 1}个',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   },
        // ),

        // 基础用法
        // body: ListView(
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       height: 50,
        //       margin: EdgeInsets.only(bottom: 10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text('我是第${index + 1}个', style: TextStyle(color: Colors.white)),
        //     );
        //   }),
        // ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
