import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/list',
      routes: {
        '/detail': (context) => DetailPage(),
        '/list': (context) => ListPage(),
      },
      home: ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表页')),
      body: ListView.builder(
        itemCount: 100,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailPage()),
              // );
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: {'id': index + 1},
              );
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
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _id = '';
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        Map<String, dynamic> params =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        setState(() {
          _id = params['id'].toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('列表页$_id'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('返回上一页'),
            ),
          ],
        ),
      ),
    );
  }
}
