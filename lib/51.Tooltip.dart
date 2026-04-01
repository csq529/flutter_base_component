import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/*
  Tooltip 是一个 Flutter 组件，它用于在用户长按或悬停在一个组件上时显示一个提示信息。Tooltip 可以提供额外的信息或指导，帮助用户更好地理解界面元素的功能。Tooltip 的主要属性包括：
- message：要显示的提示信息文本。
- decoration：提示框的装饰，可以自定义背景颜色、边框、阴影等。
- textStyle：提示信息文本的样式，可以设置字体、颜色、大小等。
- triggerMode：触发提示的方式，可以是长按（TooltipTriggerMode.longPress）或手动触发（TooltipTriggerMode.manual）。
- child：要显示提示的子组件，用户与这个组件交互时会触发提示的显示。

*/

class MyTooltip extends StatefulWidget {
  const MyTooltip({super.key});

  @override
  State<MyTooltip> createState() => _MyTooltipState();
}

class _MyTooltipState extends State<MyTooltip> {
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

/*
  Tooltip 是一个 Flutter 组件，它用于在用户长按或悬停在一个组件上时显示一个提示信息。Tooltip 可以提供额外的信息或指导，帮助用户更好地理解界面元素的功能。Tooltip 的主要属性包括：
- message：要显示的提示信息文本。
- decoration：提示框的装饰，可以自定义背景颜色、边框、阴影等。
- textStyle：提示信息文本的样式，可以设置字体、颜色、大小等。
- triggerMode：触发提示的方式，可以是长按（TooltipTriggerMode.longPress）或手动触发（TooltipTriggerMode.manual）。
- child：要显示提示的子组件，用户与这个组件交互时会触发提示的显示。

*/

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

void main() {
  runApp(const MaterialApp(home: MyTooltip()));
}''',
      demoBuilder: () => Scaffold(
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
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyTooltip()));
}
