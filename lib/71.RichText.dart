import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// RichText 示例页面
/// 用途：展示富文本的多种样式组合，适用于需要混合样式的文本场景
class RichTextDemo extends StatefulWidget {
  const RichTextDemo({super.key});

  @override
  State<RichTextDemo> createState() => _RichTextDemoState();
}

class _RichTextDemoState extends State<RichTextDemo> {
  bool _showSourceCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 示例 1：基础富文本
            _buildCard('基础用法', _buildBasicRichText()),
            
            // 示例 2：带链接的富文本
            _buildCard('可点击链接', _buildClickableRichText()),
            
            // 示例 3：混合样式
            _buildCard('混合样式', _buildMixedStyleRichText()),
            
            // 属性说明表格
            _buildPropertyTable(),
            
            // 源代码展示（可切换）
            if (_showSourceCode) _buildSourceCodeView(),
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

  /// 示例 1：基础富文本
  Widget _buildBasicRichText() {
    return RichText(
      text: const TextSpan(
        text: '这是一段 ',
        style: TextStyle(fontSize: 16, color: Colors.black87),
        children: [
          TextSpan(
            text: '加粗',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' 和 '),
          TextSpan(
            text: '斜体',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: ' 的混合文本'),
        ],
      ),
    );
  }

  /// 示例 2：带链接的富文本
  Widget _buildClickableRichText() {
    return RichText(
      text: TextSpan(
        text: '访问 ',
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        children: [
          TextSpan(
            text: 'Flutter 官网',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // 处理点击事件
                debugPrint('点击了链接');
              },
          ),
          const TextSpan(text: ' 了解更多'),
        ],
      ),
    );
  }

  /// 示例 3：混合样式
  Widget _buildMixedStyleRichText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 16),
        children: [
          TextSpan(
            text: '⚠️ ',
            style: TextStyle(fontSize: 20),
          ),
          TextSpan(
            text: '警告：',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          TextSpan(
            text: '这是一个重要提示，',
            style: TextStyle(color: Colors.black87),
          ),
          TextSpan(
            text: '请仔细阅读',
            style: TextStyle(
              backgroundColor: Colors.yellow,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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
              '📋 RichText 属性说明',
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
              _buildTableRow('text', 'TextSpan', '必需，文本内容树'),
              _buildTableRow('textAlign', 'TextAlign', '文本对齐方式'),
              _buildTableRow('textDirection', 'TextDirection', '文本方向'),
              _buildTableRow('softWrap', 'bool', '是否自动换行'),
              _buildTableRow('overflow', 'TextOverflow', '溢出处理方式'),
              _buildTableRow('maxLines', 'int', '最大显示行数'),
              _buildTableRow('textScaleFactor', 'double', '文本缩放比例'),
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

  /// 源代码展示
  Widget _buildSourceCodeView() {
    return Card(
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💻 源代码',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                '''
RichText(
  text: const TextSpan(
    style: TextStyle(fontSize: 16),
    children: [
      TextSpan(
        text: '普通文本',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
        text: '加粗文本',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: '可点击',
        style: TextStyle(color: Colors.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () {},
      ),
    ],
  ),
)
''',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}