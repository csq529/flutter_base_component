import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

// ============================================================================
// AspectRatio 宽高比组件演示
// ============================================================================

/// [AspectRatioDemo] 是 AspectRatio 组件的完整演示页面
///
/// **用途**：
/// 1. 展示如何约束子组件的宽高比例
/// 2. 演示不同宽高比的实际效果
/// 3. 提供常见场景的使用示例（卡片、图片、视频等）
///
/// **特点**：
/// - 包含多种常用宽高比示例（1:1、16:9、4:3、黄金比例等）
/// - 提供属性说明表格和源代码查看功能
/// - 统一的卡片式布局，便于学习和参考
/// - 支持动态调整宽高比观察效果变化
class AspectRatioDemo extends StatefulWidget {
  const AspectRatioDemo({super.key});

  @override
  State<AspectRatioDemo> createState() => _AspectRatioDemoState();
}

class _AspectRatioDemoState extends State<AspectRatioDemo> {
  // ==========================================================================
  // 成员变量
  // ==========================================================================

  /// [_currentAspectRatio] 当前选中的宽高比
  /// 用于动态演示不同宽高比的效果
  double _currentAspectRatio = 16 / 9;

  // ==========================================================================
  // UI 构建方法
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 提取的源代码字符串
      sourceCode: _getSourceCode(),
      // 实际演示界面
      demoBuilder: () => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 属性说明表格
              _buildPropertyTable(),
              const SizedBox(height: 24),
              // 动态调整区域
              _buildDynamicAdjustment(),
              const SizedBox(height: 24),
              // 常用宽高比示例
              _buildCommonExamples(),
              const SizedBox(height: 24),
              // 实际应用场景
              _buildUsageScenarios(),
            ],
          ),
        ),
      ),
    );
  }

  /// [_buildPropertyTable] 构建属性说明表格
  ///
  /// 使用 [Table] 组件展示 AspectRatio 的核心属性和说明
  Widget _buildPropertyTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 AspectRatio 属性说明',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1), // 属性名列
              1: FlexColumnWidth(1), // 类型列
              2: FlexColumnWidth(2), // 说明列
            },
            children: [
              _buildTableRow('属性', '类型', '说明'),
              _buildTableRow('aspectRatio', 'double', '目标宽高比（宽度/高度）'),
              _buildTableRow('child', 'Widget', '子组件，会被约束为指定宽高比'),
              _buildTableRow('key', 'Key?', '组件的唯一标识符'),
              _buildTableRow('1:1', '示例', '正方形，常用于头像、图标'),
              _buildTableRow('16:9', '示例', '视频、横幅常用比例'),
              _buildTableRow('4:3', '示例', '传统照片、屏幕比例'),
              _buildTableRow('0.618', '示例', '黄金比例，设计常用'),
            ],
          ),
        ],
      ),
    );
  }

  /// [_buildTableRow] 构建表格行
  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(
      children: [
        _buildTableCell(col1, isHeader: true),
        _buildTableCell(col2, isHeader: true),
        _buildTableCell(col3, isHeader: true),
      ],
    );
  }

  /// [_buildTableCell] 构建表格单元格
  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 14 : 13,
        ),
      ),
    );
  }

  /// [_buildDynamicAdjustment] 构建动态调整区域
  Widget _buildDynamicAdjustment() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎚️ 动态调整宽高比',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Slider(
              value: _currentAspectRatio,
              min: 0.5,
              max: 3.0,
              divisions: 25,
              label: _currentAspectRatio.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _currentAspectRatio = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // 动态预览区域
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: AspectRatio(
                aspectRatio: _currentAspectRatio,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.aspect_ratio,
                        size: 48,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_currentAspectRatio.toStringAsFixed(2)} : 1',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '宽度 : 高度',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
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

  /// [_buildCommonExamples] 构建常用宽高比示例
  Widget _buildCommonExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📐 常用宽高比示例',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildAspectRatioItem('1:1 正方形', 1.0, Colors.red),
            const SizedBox(height: 12),
            _buildAspectRatioItem('16:9 视频', 16 / 9, Colors.orange),
            const SizedBox(height: 12),
            _buildAspectRatioItem('4:3 照片', 4 / 3, Colors.green),
            const SizedBox(height: 12),
            _buildAspectRatioItem('3:2 相机', 3 / 2, Colors.teal),
            const SizedBox(height: 12),
            _buildAspectRatioItem('0.618 黄金比例', 0.618, Colors.purple),
          ],
        ),
      ),
    );
  }

  /// [_buildAspectRatioItem] 构建单个宽高比示例项
  Widget _buildAspectRatioItem(String label, double ratio, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.5)),
          ),
          child: AspectRatio(
            aspectRatio: ratio,
            child: Center(
              child: Text(
                '${ratio.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// [_buildUsageScenarios] 构建实际应用场景
  Widget _buildUsageScenarios() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎬 实际应用场景',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 场景 1: 视频播放器
            _buildScenarioCard(
              title: '视频播放器',
              aspectRatio: 16 / 9,
              icon: Icons.video_library,
              description: '16:9 是视频内容的标准比例',
              color: Colors.red,
            ),
            const SizedBox(height: 12),
            // 场景 2: 头像卡片
            _buildScenarioCard(
              title: '头像/图标',
              aspectRatio: 1.0,
              icon: Icons.person,
              description: '1:1 正方形适合头像和图标',
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            // 场景 3: 图片画廊
            _buildScenarioCard(
              title: '图片画廊',
              aspectRatio: 4 / 3,
              icon: Icons.photo,
              description: '4:3 适合展示照片缩略图',
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            // 场景 4: 横幅广告
            _buildScenarioCard(
              title: '横幅广告',
              aspectRatio: 3.0,
              icon: Icons.ad_units,
              description: '宽屏比例适合横幅展示',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildScenarioCard] 构建场景卡片
  Widget _buildScenarioCard({
    required String title,
    required double aspectRatio,
    required IconData icon,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // 预览区域
          SizedBox(
            width: 80,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // 文字说明
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// [_getSourceCode] 获取源代码字符串
  String _getSourceCode() {
    return '''
// AspectRatio 核心使用示例
import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AspectRatio 演示')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 示例 1: 16:9 视频比例
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text('16:9 视频'),
                ),
              ),
            ),
            
            // 示例 2: 1:1 正方形
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text('1:1 正方形'),
                ),
              ),
            ),
            
            // 示例 3: 4:3 照片比例
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text('4:3 照片'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''';
  }
}
