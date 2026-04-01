import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/*
  AbsorbPointer 是一个 Flutter 组件，用于阻止其子组件接收指针事件。当 AbsorbPointer 的 absorbing 属性设置为 true 时，它会吸收所有的指针事件，使得其子组件无法响应用户的点击、触摸等交互操作。AbsorbPointer 的主要属性包括：
- absorbing：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 会吸收所有的指针事件，使得其子组件无法响应用户的交互操作。当设置为 false 时，AbsorbPointer 不会吸收指针事件，子组件可以正常响应用户的交互操作。
- child：要包裹的子组件。当 absorbing 设置为 true 时，子组件将无法响应用户的交互操作。
- ignoringSemantics：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 不仅会吸收指针事件，还会忽略语义信息，使得子组件在语义树中不可见。这对于无障碍功能可能会有影响，需要根据具体需求进行设置。
- ignoringPointer：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 不仅会吸收指针事件，还会阻止子组件接收指针事件，使得子组件无法响应用户的交互操作。这与 absorbing 属性类似，但 ignoringPointer 会完全阻止子组件接收指针事件，而 absorbing 只是吸收事件但不阻止子组件接收事件。
- ignoring：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 会同时设置 absorbing 和 ignoringPointer 为 true，使得子组件无法响应用户的交互操作，并且完全阻止子组件接收指针事件。
*/ 

class MyAbsorbPointer extends StatefulWidget {
  const MyAbsorbPointer({super.key});

  @override
  State<MyAbsorbPointer> createState() => _MyAbsorbPointerState();
}

class _MyAbsorbPointerState extends State<MyAbsorbPointer> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

/*
  AbsorbPointer 是一个 Flutter 组件，用于阻止其子组件接收指针事件。当 AbsorbPointer 的 absorbing 属性设置为 true 时，它会吸收所有的指针事件，使得其子组件无法响应用户的点击、触摸等交互操作。AbsorbPointer 的主要属性包括：
- absorbing：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 会吸收所有的指针事件，使得其子组件无法响应用户的交互操作。当设置为 false 时，AbsorbPointer 不会吸收指针事件，子组件可以正常响应用户的交互操作。
- child：要包裹的子组件。当 absorbing 设置为 true 时，子组件将无法响应用户的交互操作。
- ignoringSemantics：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 不仅会吸收指针事件，还会忽略语义信息，使得子组件在语义树中不可见。这对于无障碍功能可能会有影响，需要根据具体需求进行设置。
- ignoringPointer：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 不仅会吸收指针事件，还会阻止子组件接收指针事件，使得子组件无法响应用户的交互操作。这与 absorbing 属性类似，但 ignoringPointer 会完全阻止子组件接收指针事件，而 absorbing 只是吸收事件但不阻止子组件接收事件。
- ignoring：一个布尔值，默认为 false。当设置为 true 时，AbsorbPointer 会同时设置 absorbing 和 ignoringPointer 为 true，使得子组件无法响应用户的交互操作，并且完全阻止子组件接收指针事件。
*/ 

class MyAbsorbPointer extends StatefulWidget {
  const MyAbsorbPointer({super.key});

  @override
  State<MyAbsorbPointer> createState() => _MyAbsorbPointerState();
}

class _MyAbsorbPointerState extends State<MyAbsorbPointer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AbsorbPointer(
            absorbing: true, // 禁用点击
            child: ElevatedButton(
              onPressed: () {
                print('点击了按钮');
              },
              child: const Text('点击按钮'),
            ),
          ),
        ),
      )
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyAbsorbPointer()));
}''',
      demoBuilder: () => Scaffold(
        body: SafeArea(
          child: Center(
            child: AbsorbPointer(
              absorbing: true, // 禁用点击
              child: ElevatedButton(
                onPressed: () {
                  print('点击了按钮');
                },
                child: const Text('点击按钮'),
              ),
            ),
          ),
        )
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyAbsorbPointer()));
}
