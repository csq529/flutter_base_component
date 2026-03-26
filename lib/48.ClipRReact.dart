import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyClipRReact()));
}

class MyClipRReact extends StatefulWidget {
  const MyClipRReact({super.key});

  @override
  State<MyClipRReact> createState() => _MyClipRReactState();
}

class _MyClipRReactState extends State<MyClipRReact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.hardEdge,
          child: FadeInImage.assetNetwork(
            placeholder: 'lib/image/01.png',
            image: 'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
