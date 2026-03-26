import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MySliverGrid()));
}

class MySliverGrid extends StatefulWidget {
  const MySliverGrid({super.key});

  @override
  State<MySliverGrid> createState() => _MySliverGridState();
}

Widget _buildSliverGridCount() {
  return SliverGrid.count(
    crossAxisCount: 2, // 主轴方向数量
    children: [
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.amber),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.pink),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.orange),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.blue),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    ],
  );
}

Widget _buildSliverGridBuilder() {
  return SliverGrid.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
    ),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text('Item $index', style: TextStyle(color: Colors.white)),
      );
    },
    itemCount: 20,
  );
}

Widget _buildSliverGridExtent() {
  return SliverGrid.extent(
    maxCrossAxisExtent: 100,
    children: [
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.amber),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.pink),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(color: Colors.purple),
      )
    ]
  );
}

class _MySliverGridState extends State<MySliverGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              // _buildSliverGridCount()
              // _buildSliverGridBuilder(),
              _buildSliverGridExtent()
            ],
          ),
        ),
      ),
    );
  }
}
