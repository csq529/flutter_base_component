import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyTooltip()));
}

class MyTooltip extends StatefulWidget {
  const MyTooltip({super.key});

  @override
  State<MyTooltip> createState() => _MyTooltipState();
}

class _MyTooltipState extends State<MyTooltip> {
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tooltip(
                key: _tooltipKey,
                message: 'This is a tooltip',
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(color: Colors.white),
                triggerMode: TooltipTriggerMode.manual,
                child: ElevatedButton(
                  onPressed: () {
                    _tooltipKey.currentState?.ensureTooltipVisible();
                  },
                  child: const Text('点击查看提示'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // 也可以在其他地方触发
                  _tooltipKey.currentState?.ensureTooltipVisible();
                },
                child: const Text('从其他地方触发'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}