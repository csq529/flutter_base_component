import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyPageView()));
}

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical, // 默认横向滚动，Axis.vertical:纵向滚动
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('page1', style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('page2', style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text('page3', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
