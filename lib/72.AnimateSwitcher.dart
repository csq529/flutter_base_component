import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// AnimatedSwitcher 示例页面
/// 用途：展示组件切换时的动画效果，适用于状态变化、内容更新的场景
class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  int _counter = 0;
  bool _isLight = false;
  int _currentIndex = 0;

  // 切换动画类型
  final List<Widget Function(Widget, Animation<double>)> _transitionBuilders = [
    (child, animation) => FadeTransition(child: child, opacity: animation),
    (child, animation) => ScaleTransition(child: child, scale: animation),
    (child, animation) => RotationTransition(
      turns: animation,
      child: FadeTransition(child: child, opacity: animation),
    ),
    (child, animation) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(child: child, opacity: animation),
    ),
  ];
  int _currentTransition = 0;

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

/// AnimatedSwitcher 示例页面
/// 用途：展示组件切换时的动画效果，适用于状态变化、内容更新的场景
class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  int _counter = 0;
  bool _isLight = false;
  int _currentIndex = 0;

  // 切换动画类型
  final List<Widget Function(Widget, Animation<double>)> _transitionBuilders = [
    (child, animation) => FadeTransition(child: child, opacity: animation),
    (child, animation) => ScaleTransition(child: child, scale: animation),
    (child, animation) => RotationTransition(
          turns: animation,
          child: FadeTransition(child: child, opacity: animation),
        ),
    (child, animation) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(child: child, opacity: animation),
        ),
  ];
  int _currentTransition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher 示例'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 示例 1：数字计数切换
            _buildCard('数字计数切换', _buildCounterExample()),
            
            // 示例 2：主题切换
            _buildCard('主题切换', _buildThemeExample()),
            
            // 示例 3：图片切换
            _buildCard('图片切换', _buildImageExample()),
            
            // 示例 4：自定义动画
            _buildCard('自定义动画', _buildCustomAnimationExample()),
            
            // 属性说明表格
            _buildPropertyTable(),
          ],
        ),
      ),
    );
  }

  /// 卡片容器
  Widget _buildCard(String title, Widget content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  /// 示例 1：数字计数切换
  Widget _buildCounterExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() => _counter--);
          },
        ),
        const SizedBox(width: 16),
        // AnimatedSwitcher 核心用法
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '\$_counter',
            key: ValueKey<int>(_counter), // 必须：key 变化才能触发动画
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() => _counter++);
          },
        ),
      ],
    );
  }

  /// 示例 2：主题切换
  Widget _buildThemeExample() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(child: child, opacity: animation);
        },
        child: _isLight
            ? Container(
                key: const ValueKey<bool>(true),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.light_mode, size: 50),
              )
            : Container(
                key: const ValueKey<bool>(false),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.dark_mode, size: 50),
              ),
      ),
    );
  }

  /// 示例 3：图片切换
  Widget _buildImageExample() {
    final List<String> images = [
      '🍎',
      '🍊',
      '🍇',
      '🍓',
    ];

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Text(
            images[_currentIndex],
            key: ValueKey<int>(_currentIndex),
            style: const TextStyle(fontSize: 80),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex - 1 + images.length) % images.length;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex + 1) % images.length;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  /// 示例 4：自定义动画
  Widget _buildCustomAnimationExample() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: _transitionBuilders[_currentTransition],
          child: Container(
            key: ValueKey<int>(_currentTransition),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.primaries[_currentTransition % Colors.primaries.length],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 40),
          ),
        ),
        const SizedBox(height: 16),
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 0, label: Text('默认')),
            ButtonSegment(value: 1, label: Text('缩放')),
            ButtonSegment(value: 2, label: Text('旋转')),
            ButtonSegment(value: 3, label: Text('滑动')),
          ],
          selected: {_currentTransition},
          onSelectionChanged: (Set<int> selected) {
            setState(() => _currentTransition = selected.first);
          },
        ),
      ],
    );
  }

  /// 属性说明表格
  Widget _buildPropertyTable() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 AnimatedSwitcher 属性说明',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
            },
            children: [
              _buildTableRow('属性', '类型', '说明'),
              _buildTableRow('child', 'Widget', '当前显示的子组件'),
              _buildTableRow('duration', 'Duration', '动画持续时间'),
              _buildTableRow('transitionBuilder', 'Function', '自定义过渡动画构建器'),
              _buildTableRow('layoutBuilder', 'Function', '布局构建器，控制大小变化动画'),
              _buildTableRow('switchInCurve', 'Curve', '进入动画曲线'),
              _buildTableRow('switchOutCurve', 'Curve', '退出动画曲线'),
              _buildTableRow('reverseDuration', 'Duration', '反向动画持续时间'),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建表格行
  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(
      children: [
        _buildTableCell(col1, isHeader: true),
        _buildTableCell(col2, isHeader: true),
        _buildTableCell(col3, isHeader: true),
      ],
    );
  }

  /// 构建表格单元格
  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blue : Colors.black87,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: AnimatedSwitcherDemo()));
}''',
      demoBuilder: () => Scaffold(
        appBar: const AppBar(
          title: Text('AnimatedSwitcher 示例'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 示例 1：数字计数切换
              _buildCard('数字计数切换', _buildCounterExample()),

              // 示例 2：主题切换
              _buildCard('主题切换', _buildThemeExample()),

              // 示例 3：图片切换
              _buildCard('图片切换', _buildImageExample()),

              // 示例 4：自定义动画
              _buildCard('自定义动画', _buildCustomAnimationExample()),

              // 属性说明表格
              _buildPropertyTable(),
            ],
          ),
        ),
      ),
    );
  }

  /// 卡片容器
  Widget _buildCard(String title, Widget content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  /// 示例 1：数字计数切换
  Widget _buildCounterExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() => _counter--);
          },
        ),
        const SizedBox(width: 16),
        // AnimatedSwitcher 核心用法
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_counter',
            key: ValueKey<int>(_counter), // 必须：key 变化才能触发动画
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() => _counter++);
          },
        ),
      ],
    );
  }

  /// 示例 2：主题切换
  Widget _buildThemeExample() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(child: child, opacity: animation);
        },
        child: _isLight
            ? Container(
                key: const ValueKey<bool>(true),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.light_mode, size: 50),
              )
            : Container(
                key: const ValueKey<bool>(false),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.dark_mode, size: 50),
              ),
      ),
    );
  }

  /// 示例 3：图片切换
  Widget _buildImageExample() {
    final List<String> images = ['🍎', '🍊', '🍇', '🍓'];

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Text(
            images[_currentIndex],
            key: ValueKey<int>(_currentIndex),
            style: const TextStyle(fontSize: 80),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _currentIndex =
                      (_currentIndex - 1 + images.length) % images.length;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex + 1) % images.length;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  /// 示例 4：自定义动画
  Widget _buildCustomAnimationExample() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: _transitionBuilders[_currentTransition],
          child: Container(
            key: ValueKey<int>(_currentTransition),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors
                  .primaries[_currentTransition % Colors.primaries.length],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 40),
          ),
        ),
        const SizedBox(height: 16),
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 0, label: Text('默认')),
            ButtonSegment(value: 1, label: Text('缩放')),
            ButtonSegment(value: 2, label: Text('旋转')),
            ButtonSegment(value: 3, label: Text('滑动')),
          ],
          selected: {_currentTransition},
          onSelectionChanged: (Set<int> selected) {
            setState(() => _currentTransition = selected.first);
          },
        ),
      ],
    );
  }

  /// 属性说明表格
  Widget _buildPropertyTable() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 AnimatedSwitcher 属性说明',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
            },
            children: [
              _buildTableRow('属性', '类型', '说明'),
              _buildTableRow('child', 'Widget', '当前显示的子组件'),
              _buildTableRow('duration', 'Duration', '动画持续时间'),
              _buildTableRow('transitionBuilder', 'Function', '自定义过渡动画构建器'),
              _buildTableRow('layoutBuilder', 'Function', '布局构建器，控制大小变化动画'),
              _buildTableRow('switchInCurve', 'Curve', '进入动画曲线'),
              _buildTableRow('switchOutCurve', 'Curve', '退出动画曲线'),
              _buildTableRow('reverseDuration', 'Duration', '反向动画持续时间'),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建表格行
  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(
      children: [
        _buildTableCell(col1, isHeader: true),
        _buildTableCell(col2, isHeader: true),
        _buildTableCell(col3, isHeader: true),
      ],
    );
  }

  /// 构建表格单元格
  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blue : Colors.black87,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: AnimatedSwitcherDemo()));
}
