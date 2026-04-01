import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({super.key});

  @override
  State<MySliverList> createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MySliverList()));
}

class MySliverList extends StatefulWidget {
  const MySliverList({super.key});

  @override
  State<MySliverList> createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverList(
            //   delegate: SliverChildListDelegate([
            //     Container(
            //       width: double.infinity,
            //       height: 500,
            //       decoration: BoxDecoration(color: Colors.blue),
            //     ),

            //     Container(
            //       width: double.infinity,
            //       height: 500,
            //       decoration: BoxDecoration(color: Colors.orange),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       height: 500,
            //       decoration: BoxDecoration(color: Colors.pink),
            //     ),
            //   ]),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Item \$index', style: TextStyle(color: Colors.white))
                );
              }, childCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // SliverList(
              //   delegate: SliverChildListDelegate([
              //     Container(
              //       width: double.infinity,
              //       height: 500,
              //       decoration: BoxDecoration(color: Colors.blue),
              //     ),

              //     Container(
              //       width: double.infinity,
              //       height: 500,
              //       decoration: BoxDecoration(color: Colors.orange),
              //     ),
              //     Container(
              //       width: double.infinity,
              //       height: 500,
              //       decoration: BoxDecoration(color: Colors.pink),
              //     ),
              //   ]),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  return Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text('Item $index', style: TextStyle(color: Colors.white))
                  );
                }, childCount: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MySliverList()));
}
