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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                color: Colors.blue,
                child: Text(
                  '轮播图',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverPersistentHeader(
              delegate: _StickCategory(), // 自定义组件
              pinned: true // 吸顶
            ),

            SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(100, (index) {
                return Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    '列表${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
            // SliverList.separated(
            //   itemCount: 20,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       alignment: Alignment.center,
            //       width: 100,
            //       height: 50,
            //       color: Colors.blue,
            //       child: Text(
            //         '分类${index + 1}',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return SizedBox(height: 10);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class _StickCategory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            alignment: Alignment.center,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            child: Text(
              '分类${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
