import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/*
  ClipRReact 剪裁圆角矩形组件
  ClipRRect 是一个 Flutter 组件，用于将子组件剪裁成圆角矩形。它的主要属性包括：
- borderRadius：定义圆角的半径，可以使用 BorderRadius.circular() 来设置统一的圆角，或者使用 BorderRadius.only() 来设置不同角的圆角。
- clipBehavior：定义剪裁行为，常用的值有 Clip.hardEdge（默认值，剪裁到边界）、Clip.antiAlias（抗锯齿剪裁）和 Clip.antiAliasWithSaveLayer（抗锯齿剪裁并保存图层）。

*/

class MyClipRReact extends StatefulWidget {
  const MyClipRReact({super.key});

  @override
  State<MyClipRReact> createState() => _MyClipRReactState();
}

class _MyClipRReactState extends State<MyClipRReact> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

/*
  ClipRReact 剪裁圆角矩形组件
  ClipRRect 是一个 Flutter 组件，用于将子组件剪裁成圆角矩形。它的主要属性包括：
- borderRadius：定义圆角的半径，可以使用 BorderRadius.circular() 来设置统一的圆角，或者使用 BorderRadius.only() 来设置不同角的圆角。
- clipBehavior：定义剪裁行为，常用的值有 Clip.hardEdge（默认值，剪裁到边界）、Clip.antiAlias（抗锯齿剪裁）和 Clip.antiAliasWithSaveLayer（抗锯齿剪裁并保存图层）。

*/

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

void main() {
  runApp(MaterialApp(home: MyClipRReact()));
}''',
      demoBuilder: () => Scaffold(
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            clipBehavior: Clip.hardEdge,
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyClipRReact()));
}
