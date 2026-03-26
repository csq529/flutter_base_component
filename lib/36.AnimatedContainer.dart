import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AnimatedContainerWidget()));
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Color _color = const Color(0xFF666666);

  void _toggleColor() {
    setState(() {
      _color = _color.value == 0xFF666666
          ? const Color(0xFF2482FC)
          : const Color(0xFF666666);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _toggleColor,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 100,
            height: 100,
            color: _color,
          ),
        ),
      ),
    );
  }
}