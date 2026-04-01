import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('列表页')),
        body: ListView.builder(
          itemCount: 100,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                alignment: Alignment.center,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  '列表\${index + 1}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('返回上一页'))
      )
    );
  }
}''',
      demoBuilder: () => Scaffold(
        appBar: AppBar(title: Text('列表页')),
        body: ListView.builder(
          itemCount: 100,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                alignment: Alignment.center,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  '列表${index + 1}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('返回上一页'))
      )
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
