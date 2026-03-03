import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text('GridView')),
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                200, // 设置子元素最大宽度，GridView 会根据 available width 自动计算每行显示的子元素数量
            childAspectRatio: 2.0, // 设置子元素宽高比，默认为1.0
            mainAxisSpacing: 10.0, // 设置主轴方向的间距
            crossAxisSpacing: 10.0, // 设置交叉轴方向的间距
          ),

          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 5, // 设置每行显示的子元素数量
          //   childAspectRatio: 2.0, // 设置子元素宽高比，默认为1.0
          //   mainAxisSpacing: 10.0, // 设置主轴方向的间距
          //   crossAxisSpacing: 10.0, // 设置交叉轴方向的间距
          // ),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                '我是第${index + 1}个',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),

        // body: GridView.extent(
        //   maxCrossAxisExtent: 200, // 设置子元素最大宽度，GridView 会根据 available width 自动计算每行显示的子元素数量
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       margin: EdgeInsets.all(10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text(
        //         '我是第${index + 1}个',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),

        // body: GridView.count(
        //   scrollDirection: Axis.vertical, // 设置滚动方向，默认为垂直方向
        //   crossAxisCount: 4, // 设置每行显示的子元素数量
        //   // childAspectRatio: 2.0, // 设置子元素宽高比，默认为1.0
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       margin: EdgeInsets.all(10),
        //       decoration: BoxDecoration(color: Colors.blue),
        //       child: Text('我是第${index + 1}个', style: TextStyle(color: Colors.white)),
        //     );
        //   })
        // ),
      ),
    );
  }
}
