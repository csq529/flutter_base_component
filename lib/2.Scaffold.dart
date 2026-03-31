import 'package:flutter/material.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('头部区域'),
        ),
        body: Container(
          child: Center(
            child: const Text("中部区域")
          )
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: Center(
            child: const Text("底部区域")
          )
        )
      )
    );
  }
}