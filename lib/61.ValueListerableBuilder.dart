import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// ValueListenableBuilder 监听构建器演示
///
/// **用途**：
/// 1. 监听 ValueListenable 的值变化
/// 2. 局部刷新 UI，避免整个页面重建
/// 3. 性能优化，减少不必要的 rebuild
/// 4. 常用于计数器、表单状态、主题切换等场景
///
/// **核心优势**：
/// - 只重建受影响的 widget
/// - child 参数可缓存不变的组件
/// - 比 setState 更精细的控制
class ValueListenableBuilderDemo extends StatefulWidget {
  const ValueListenableBuilderDemo({super.key});

  @override
  State<ValueListenableBuilderDemo> createState() =>
      _ValueListenableBuilderDemoState();
}

class _ValueListenableBuilderDemoState
    extends State<ValueListenableBuilderDemo> {
  // 创建 ValueNotifier 监听器
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<String> _inputText = ValueNotifier<String>('');
  final ValueNotifier<bool> _isDarkMode = ValueNotifier<bool>(false);

  @override
  void dispose() {
    // 释放资源
    _counter.dispose();
    _inputText.dispose();
    _isDarkMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

/// ValueListenableBuilder 监听构建器演示
class ValueListenableBuilderDemo extends StatefulWidget {
  const ValueListenableBuilderDemo({super.key});

  @override
  State<ValueListenableBuilderDemo> createState() =>
      _ValueListenableBuilderDemoState();
}

class _ValueListenableBuilderDemoState
    extends State<ValueListenableBuilderDemo> {
  // 创建 ValueNotifier 监听器
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ValueListenableBuilder 演示')),
      body: Column(
        children: [
          // 监听计数器变化
          ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text('计数：\$value');
            },
          ),
          ElevatedButton(
            onPressed: () => _counter.value++,
            child: const Text('增加'),
          ),
        ],
      ),
    );
  }
}''',
      // 实际演示组件
      demoBuilder: () => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========== 属性说明表格 ==========
              _buildSectionTitle('📋 ValueListenableBuilder 属性说明'),
              _buildPropertyTable(),

              const SizedBox(height: 24),

              // ========== 使用场景表格 ==========
              _buildSectionTitle('🎯 常见使用场景'),
              _buildScenarioTable(),

              const SizedBox(height: 24),

              // ========== 场景 1: 计数器演示 ==========
              _buildSectionTitle('1. 计数器演示'),
              _buildCounterDemo(),

              const SizedBox(height: 24),

              // ========== 场景 2: 文本输入监听 ==========
              _buildSectionTitle('2. 文本输入监听'),
              _buildTextDemo(),

              const SizedBox(height: 24),

              // ========== 场景 3: 主题切换 ==========
              _buildSectionTitle('3. 主题切换演示'),
              _buildThemeDemo(),

              const SizedBox(height: 24),

              // ========== 性能对比说明 ==========
              _buildSectionTitle('💡 性能优化说明'),
              _buildPerformanceTip(),
            ],
          ),
        ),
      ),
    );
  }

  // 构建章节标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 构建属性说明表格
  Widget _buildPropertyTable() {
    return Table(
      border: TableBorder.all(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(2.5),
      },
      children: [
        // 表头
        TableRow(
          decoration: BoxDecoration(color: Colors.blue[50]),
          children: [
            _buildTableCell('属性', isHeader: true),
            _buildTableCell('类型', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        // 属性行
        TableRow(
          children: [
            _buildTableCell('valueListenable'),
            _buildTableCell('ValueListenable<T>'),
            _buildTableCell('要监听的可变值对象（必填）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('builder'),
            _buildTableCell('Widget Function'),
            _buildTableCell('值变化时的构建回调（必填）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('child'),
            _buildTableCell('Widget?'),
            _buildTableCell('不变的子组件，用于性能优化'),
          ],
        ),
      ],
    );
  }

  // 构建使用场景表格
  Widget _buildScenarioTable() {
    return Table(
      border: TableBorder.all(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(3)},
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.green[50]),
          children: [
            _buildTableCell('场景', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        TableRow(
          children: [_buildTableCell('计数器'), _buildTableCell('数字变化时只更新显示区域')],
        ),
        TableRow(
          children: [_buildTableCell('表单状态'), _buildTableCell('监听输入内容，实时更新')],
        ),
        TableRow(
          children: [
            _buildTableCell('主题切换'),
            _buildTableCell('监听主题状态，切换 UI 样式'),
          ],
        ),
        TableRow(
          children: [_buildTableCell('加载状态'), _buildTableCell('监听加载进度，显示进度条')],
        ),
      ],
    );
  }

  // 计数器演示
  Widget _buildCounterDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                '当前计数：$value',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => _counter.value--,
                icon: const Icon(Icons.remove),
                label: const Text('减少'),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => _counter.value++,
                icon: const Icon(Icons.add),
                label: const Text('增加'),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => _counter.value = 0,
                icon: const Icon(Icons.refresh),
                label: const Text('重置'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 文本输入演示
  Widget _buildTextDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: '输入文本',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _inputText.value = value;
            },
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<String>(
            valueListenable: _inputText,
            builder: (context, value, child) {
              return Text(
                '实时内容：${value.isEmpty ? "（空）" : value}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              );
            },
          ),
          ValueListenableBuilder<String>(
            valueListenable: _inputText,
            builder: (context, value, child) {
              return Text(
                '字符数：${value.length}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              );
            },
          ),
        ],
      ),
    );
  }

  // 主题切换演示
  Widget _buildThemeDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDarkMode.value ? Colors.grey[800] : Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _isDarkMode,
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: value ? Colors.grey[700] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '当前模式：${value ? "🌙 深色" : "☀️ 浅色"}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: value ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: _isDarkMode,
            builder: (context, value, child) {
              return SwitchListTile(
                title: const Text('切换主题模式'),
                subtitle: const Text('点击开关切换深色/浅色'),
                value: _isDarkMode.value,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode.value = value;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // 性能优化说明
  Widget _buildPerformanceTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💡 性能优化技巧',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildTipItem('✅ 使用 child 参数缓存不变的组件'),
          _buildTipItem('✅ 只在值变化时重建受影响的 widget'),
          _buildTipItem('✅ 避免在 builder 中创建新对象'),
          _buildTipItem('✅ 记得在 dispose 中释放 ValueNotifier'),
          const SizedBox(height: 8),
          const Text(
            '对比 setState：ValueListenableBuilder 可以更精细地控制刷新范围，避免整个页面重建',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // 构建提示项
  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }

  // 构建表格单元格
  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blue[800] : Colors.black87,
        ),
      ),
    );
  }
}
