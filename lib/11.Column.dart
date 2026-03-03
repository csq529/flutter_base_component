import 'dart:collection';

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
        appBar: AppBar(title: Text('Column')),
        body: Container(
          // padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,


            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(color: Colors.blue, width: 100, height: 100),
              // SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              // SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.green,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
