import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// Flexible 弹性布局组件演示
///
/// **用途**：
/// 1. 在 Row/Column 中灵活分配剩余空间
/// 2. 控制子组件的伸缩比例
/// 3. 配合 Expanded 实现响应式布局
/// 4. 防止子组件溢出父容器
///
/// **核心要点**：
/// - 必须放在 Flex 容器内（Row/Column）
/// - flex 参数控制伸缩比例
/// - fit 参数控制子组件填充方式
class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({super.key});

  @override
  State<FlexibleDemo> createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

/// Flexible 弹性布局组件演示
class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({super.key});

  @override
  State<FlexibleDemo> createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // flex 比例分配
          Row(
            children: [
              Flexible(flex: 1, child: Container(color: Colors.red, height: 50)),
              Flexible(flex: 2, child: Container(color: Colors.blue, height: 50)),
              Flexible(flex: 1, child: Container(color: Colors.green, height: 50)),
            ],
          ),
          // fit 参数对比
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(color: Colors.orange, height: 50),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(color: Colors.purple, height: 50),
              ),
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
                    _buildSectionTitle('📋 Flexible 属性说明'),
                    _buildPropertyTable(),

                    const SizedBox(height: 16),

                    _buildSectionTitle('🎯 fit 参数说明'),
                    _buildFitTable(),
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
                      // 场景 1: flex 比例演示
                      _buildSectionTitle('1. flex 比例分配'),
                      _buildFlexRatioDemo(),

                      const SizedBox(height: 24),

                      // 场景 2: fit 参数演示
                      _buildSectionTitle('2. fit 参数对比'),
                      _buildFitDemo(),

                      const SizedBox(height: 24),

                      // 场景 3: Flexible vs Expanded
                      _buildSectionTitle('3. Flexible vs Expanded'),
                      _buildComparisonDemo(),
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
          decoration: BoxDecoration(color: Colors.purple[50]),
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
            _buildTableCell('fit'),
            _buildTableCell('FlexFit'),
            _buildTableCell('子组件填充方式（tight/loose）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('child'),
            _buildTableCell('Widget?'),
            _buildTableCell('子组件，必填参数'),
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

  // 构建 fit 参数说明表格
  Widget _buildFitTable() {
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
            _buildTableCell('fit 值', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        // 参数行
        TableRow(
          children: [
            _buildTableCell('FlexFit.tight'),
            _buildTableCell('强制子组件填满可用空间（类似 Expanded）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('FlexFit.loose'),
            _buildTableCell('子组件按需大小，不强制填满'),
          ],
        ),
      ],
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
          const Text('比例 1:2:1 分配', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              // flex: 1 - 红色区域
              Flexible(
                flex: 1,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text('flex:1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              // flex: 2 - 蓝色区域（占 2 倍空间）
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text('flex:2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              // flex: 1 - 绿色区域
              Flexible(
                flex: 1,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text('flex:1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建 fit 参数演示
  Widget _buildFitDemo() {
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
          const Text('子组件文字长度不同时的表现', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              // FlexFit.tight - 强制填满
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'tight\n强制填满',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                ),
              ),
              // FlexFit.loose - 按需大小
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'loose\n按需大小',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建对比演示
  Widget _buildComparisonDemo() {
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
          const Text('Flexible(fit: tight) 等同于 Expanded', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              // Flexible with tight
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Flexible\nfit: tight',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
              ),
              // Expanded (等效)
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.indigo[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Expanded\n(等效)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
          color: isHeader ? Colors.purple[800] : Colors.black87,
        ),
      ),
    );
  }
}