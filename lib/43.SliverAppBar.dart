import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MySliverAppBar()));
}

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({super.key});

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              title: Text('SliverAppBar'),
              floating: true,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.pink),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
