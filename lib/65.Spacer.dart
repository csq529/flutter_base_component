import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// Spacer 弹性空白组件演示
///
/// **用途**：
/// 1. 在 Row/Column 中填充剩余空白空间
/// 2. 推动其他组件到边缘位置
/// 3. 实现两端对齐布局
/// 4. 简化 Flexible 的使用场景
///
/// **核心要点**：
/// - 必须放在 Flex 容器内（Row/Column）
/// - 本质是 Flexible(flex: 1, fit: FlexFit.tight)
/// - 可设置 flex 参数控制填充比例
/// - 无子组件，仅占位空白
class SpacerDemo extends StatefulWidget {
  const SpacerDemo({super.key});

  @override
  State<SpacerDemo> createState() => _SpacerDemoState();
}

class _SpacerDemoState extends State<SpacerDemo> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

/// Spacer 弹性空白组件演示
class SpacerDemo extends StatefulWidget {
  const SpacerDemo({super.key});

  @override
  State<SpacerDemo> createState() => _SpacerDemoState();
}

class _SpacerDemoState extends State<SpacerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 两端对齐布局
          Row(
            children: [
              Text('左侧'),
              Spacer(),
              Text('右侧'),
            ],
          ),
          // 比例分配
          Row(
            children: [
              Text('A'),
              Spacer(flex: 2),
              Text('B'),
              Spacer(flex: 1),
              Text('C'),
            ],
          ),
        ],
      ),
    );
  }
}''',
      // 实际演示组件
      demoBuilder: () => Scaffold(
        body: Column(
          children: [
            // ========== 属性说明表格 ==========
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('📋 Spacer 属性说明'),
                    _buildPropertyTable(),

                    const SizedBox(height: 16),

                    _buildSectionTitle('🎯 Spacer vs Flexible 对比'),
                    _buildComparisonTable(),
                  ],
                ),
              ),
            ),

            // ========== 演示区域 ==========
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 场景 1: 两端对齐布局
                      _buildSectionTitle('1. 两端对齐布局'),
                      _buildAlignDemo(),

                      const SizedBox(height: 24),

                      // 场景 2: flex 比例分配
                      _buildSectionTitle('2. flex 比例分配'),
                      _buildFlexRatioDemo(),

                      const SizedBox(height: 24),

                      // 场景 3: Column 中的 Spacer
                      _buildSectionTitle('3. Column 中的 Spacer'),
                      _buildColumnDemo(),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
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
          decoration: BoxDecoration(color: Colors.orange[50]),
          children: [
            _buildTableCell('属性', isHeader: true),
            _buildTableCell('类型', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        // 属性行
        TableRow(
          children: [
            _buildTableCell('flex'),
            _buildTableCell('int'),
            _buildTableCell('弹性比例，默认值为 1'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('key'),
            _buildTableCell('Key?'),
            _buildTableCell('组件唯一标识'),
          ],
        ),
      ],
    );
  }

  // 构建对比表格
  Widget _buildComparisonTable() {
    return Table(
      border: TableBorder.all(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(2.5),
      },
      children: [
        // 表头
        TableRow(
          decoration: BoxDecoration(color: Colors.blue[50]),
          children: [
            _buildTableCell('特性', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        // 对比行
        TableRow(
          children: [
            _buildTableCell('Spacer'),
            _buildTableCell('简洁语法，仅填充空白，无子组件'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Flexible'),
            _buildTableCell('功能完整，可包含子组件，可设置 fit'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Expanded'),
            _buildTableCell('Flexible(fit: FlexFit.tight) 的语法糖'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('SizedBox'),
            _buildTableCell('固定尺寸，不随剩余空间变化'),
          ],
        ),
      ],
    );
  }

  // 构建两端对齐演示
  Widget _buildAlignDemo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Spacer 将内容推到两端', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          // 使用 Spacer 的两端对齐
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                _buildChip('左侧', Colors.blue),
                const Spacer(),
                _buildChip('右侧', Colors.green),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 对比：不使用 Spacer
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                _buildChip('左侧', Colors.blue),
                _buildChip('右侧', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建 flex 比例演示
  Widget _buildFlexRatioDemo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('多个 Spacer 按比例分配空间', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.orange[200]!),
            ),
            child: Row(
              children: [
                _buildChip('A', Colors.red),
                // flex: 2 - 占 2 份空白
                const Spacer(flex: 2),
                _buildChip('B', Colors.blue),
                // flex: 1 - 占 1 份空白
                const Spacer(flex: 1),
                _buildChip('C', Colors.green),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 比例说明
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRatioLabel('2 份', Colors.red),
              _buildRatioLabel('1 份', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  // 构建 Column 中的 Spacer 演示
  Widget _buildColumnDemo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Column 中垂直方向填充空间', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            height: 200,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.purple[200]!),
            ),
            child: Column(
              children: [
                _buildChip('顶部', Colors.purple),
                // 垂直方向填充
                const Spacer(),
                _buildChip('中间', Colors.teal),
                const Spacer(flex: 2),
                _buildChip('底部', Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建标签芯片
  Widget _buildChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 构建比例标签
  Widget _buildRatioLabel(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
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
          color: isHeader ? Colors.orange[800] : Colors.black87,
        ),
      ),
    );
  }
}