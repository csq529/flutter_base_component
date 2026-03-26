import 'package:flutter/material.dart';

void main() {
  runApp(ExpandedWeiget());
}

class ExpandedWeiget extends StatelessWidget {
  const ExpandedWeiget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.amber),
                ),
                // SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green
                    ),
                  )
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
