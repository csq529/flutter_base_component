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
          margin: EdgeInsets.all(20),
          transform: Matrix4.rotationZ(0.05),

          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.amber),
          ),
          // color: Colors.red,
          child: Text(
            'Hello Container!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
