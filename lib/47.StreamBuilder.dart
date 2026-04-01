import 'dart:async';
import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/*
  StreamBuilder 是一个 Flutter 组件，用于构建基于异步数据流的用户界面。它监听一个 Stream，并在 Stream 中的数据发生变化时自动重建其子组件。StreamBuilder 的主要属性包括：
- stream：要监听的 Stream 对象。当 Stream 中的数据发生变化时，StreamBuilder 会自动重建其子组件。
- builder：一个函数，接受 BuildContext 和 AsyncSnapshot 作为参数。AsyncSnapshot 包含了 Stream 中的数据、错误信息和连接状态等。你可以在 builder 函数中根据这些信息来构建不同的 UI。
*/

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  //步骤1:初始化一个StreamController<任何数据> 简单的可以扔一个int,string,开发中经常扔一个网络请求的model进去，具体看你使用场景了。
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose(){
  //步骤2.关流，不管流会消耗资源，同时会引起内存泄漏
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'dart:async';
import 'package:flutter/material.dart';

/*
  StreamBuilder 是一个 Flutter 组件，用于构建基于异步数据流的用户界面。它监听一个 Stream，并在 Stream 中的数据发生变化时自动重建其子组件。StreamBuilder 的主要属性包括：
- stream：要监听的 Stream 对象。当 Stream 中的数据发生变化时，StreamBuilder 会自动重建其子组件。
- builder：一个函数，接受 BuildContext 和 AsyncSnapshot 作为参数。AsyncSnapshot 包含了 Stream 中的数据、错误信息和连接状态等。你可以在 builder 函数中根据这些信息来构建不同的 UI。
*/

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  //步骤1:初始化一个StreamController<任何数据> 简单的可以扔一个int,string,开发中经常扔一个网络请求的model进去，具体看你使用场景了。
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose(){
  //步骤2.关流，不管流会消耗资源，同时会引起内存泄漏
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
      //步骤3.使用StreamBuilder构造器
        child: StreamBuilder<int>(  // 监听Stream，每次值改变的时候，更新Text中的内容
          stream: _streamController.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Text('You hit me: \${snapshot.data} times');
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
          // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
          //步骤4.往StreamBuilder里添加流，数据变了，就用通知小部件
          _streamController.sink.add(++_counter);
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CounterPage()));''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('Stream version of the Counter App')),
        body: Center(
        //步骤3.使用StreamBuilder构造器
          child: StreamBuilder<int>(  // 监听Stream，每次值改变的时候，更新Text中的内容
            stream: _streamController.stream,
            initialData: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Text('You hit me: ${snapshot.data} times');
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
            // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
            // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
            //步骤4.往StreamBuilder里添加流，数据变了，就用通知小部件
            _streamController.sink.add(++_counter);
          },
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CounterPage()));
