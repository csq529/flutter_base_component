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
        appBar: AppBar(title: Text('Flutter Demo')),
        body: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: List.generate(100, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      color: Colors.blue,
                      child: Text(
                        '我是第${index + 1}个',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    print('去底部');
                    _controller.animateTo(_controller.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeInOut);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '去底部',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    _controller.animateTo(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '去顶部',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
