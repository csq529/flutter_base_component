import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('父组件', style: TextStyle(color: Colors.red, fontSize: 20)),
              Child(message: '父组件向子组件传递的数据'),
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final String? message;
  const Child({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('子组件-$message'));
  }
}
