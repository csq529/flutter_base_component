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
        body: Center(
          child: Container(
            // alignment: Alignment.center,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(width: 2, color: Colors.blueAccent),
            ),
            child: Center(
              child: Text('居中组件', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
