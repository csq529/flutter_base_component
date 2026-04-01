import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// SizedBox 尺寸约束组件演示
///
/// **用途**：
/// 1. 设置组件固定宽高
/// 2. 作为空白间隔（替代 Padding）
/// 3. 强制约束子组件尺寸
/// 4. 性能优于 Container（无装饰属性时）
class SizeBoxDemo extends StatefulWidget {
  const SizeBoxDemo({super.key});

  @override
  State<SizeBoxDemo> createState() => _SizeBoxDemoState();
}

class _SizeBoxDemoState extends State<SizeBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

class SizeBoxDemo extends StatefulWidget {
  const SizeBoxDemo({super.key});

  @override
  State<SizeBoxDemo> createState() => _SizeBoxDemoState();
}

class _SizeBoxDemoState extends State<SizeBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBox 演示')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 属性说明表格
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.blue[50]),
                  children: [
                    _buildTableCell('属性', isHeader: true),
                    _buildTableCell('类型', isHeader: true),
                    _buildTableCell('说明', isHeader: true),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('width'),
                    _buildTableCell('double?'),
                    _buildTableCell('固定宽度'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('height'),
                    _buildTableCell('double?'),
                    _buildTableCell('固定高度'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('child'),
                    _buildTableCell('Widget?'),
                    _buildTableCell('子组件'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
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
              _buildSectionTitle('📋 SizedBox 属性说明'),
              _buildPropertyTable(),

              const SizedBox(height: 24),

              // ========== 场景 1: 设置固定宽高 ==========
              _buildSectionTitle('1. 设置固定宽高'),
              SizedBox(
                width: 200,
                height: 100,
                child: Container(
                  color: Colors.blue[100],
                  alignment: Alignment.center,
                  child: const Text('固定 200x100'),
                ),
              ),

              const SizedBox(height: 24),

              // ========== 场景 2: 作为空白间隔 ==========
              _buildSectionTitle('2. 作为空白间隔'),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.orange,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ========== 场景 3: 构造函数对比 ==========
              _buildSectionTitle('3. 构造函数对比'),
              _buildConstructorTable(),
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
        0: FlexColumnWidth(1),    // 属性列
        1: FlexColumnWidth(1),    // 类型列
        2: FlexColumnWidth(2),    // 说明列
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
            _buildTableCell('width'),
            _buildTableCell('double?'),
            _buildTableCell('设置固定宽度，为 null 时不约束'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('height'),
            _buildTableCell('double?'),
            _buildTableCell('设置固定高度，为 null 时不约束'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('child'),
            _buildTableCell('Widget?'),
            _buildTableCell('子组件，可选参数'),
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

  // 构建构造函数对比表格
  Widget _buildConstructorTable() {
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
        TableRow(
          decoration: BoxDecoration(color: Colors.green[50]),
          children: [
            _buildTableCell('构造函数', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('SizedBox()'),
            _buildTableCell('标准构造函数，可设置宽高'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('SizedBox.shrink()'),
            _buildTableCell('宽高均为 0，最小尺寸'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('SizedBox.expand()'),
            _buildTableCell('填满父容器，最大尺寸'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('SizedBox.fromSize()'),
            _buildTableCell('从 Size 对象创建'),
          ],
        ),
      ],
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