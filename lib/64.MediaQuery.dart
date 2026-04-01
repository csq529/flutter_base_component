import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// MediaQuery 媒体查询组件演示
///
/// **用途**：
/// 1. 获取屏幕尺寸信息（宽度、高度）
/// 2. 获取设备像素比（devicePixelRatio）
/// 3. 获取状态栏/导航栏/底部栏高度
/// 4. 获取屏幕方向（纵向/横向）
/// 5. 实现响应式布局适配
///
/// **核心要点**：
/// - 使用 MediaQuery.of(context) 获取数据
/// - 或使用 MediaQuery 包裹子组件设置数据
/// - 数据变化时会自动重建依赖组件
class MediaQueryDemo extends StatefulWidget {
  const MediaQueryDemo({super.key});

  @override
  State<MediaQueryDemo> createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends State<MediaQueryDemo> {
  @override
  Widget build(BuildContext context) {
    // 获取 MediaQuery 数据
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final padding = mediaQuery.padding;
    final viewInsets = mediaQuery.viewInsets;

    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

/// MediaQuery 媒体查询组件演示
class MediaQueryDemo extends StatefulWidget {
  const MediaQueryDemo({super.key});

  @override
  State<MediaQueryDemo> createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends State<MediaQueryDemo> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('屏幕宽：\${mediaQuery.size.width}')),
      body: Column(
        children: [
          // 获取状态栏高度
          Text('状态栏：\${mediaQuery.padding.top}'),
          // 获取屏幕尺寸
          Text('屏幕：\${mediaQuery.size.width} x \${mediaQuery.size.height}'),
          // 获取设备像素比
          Text('像素比：\${mediaQuery.devicePixelRatio}'),
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
                    _buildSectionTitle('📋 MediaQueryData 属性说明'),
                    _buildPropertyTable(mediaQuery),

                    const SizedBox(height: 16),

                    _buildSectionTitle('🎯 常用方法说明'),
                    _buildMethodTable(),
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
                      // 场景 1: 屏幕尺寸信息
                      _buildSectionTitle('1. 屏幕尺寸信息'),
                      _buildScreenInfoDemo(size),

                      const SizedBox(height: 24),

                      // 场景 2: 安全区域演示
                      _buildSectionTitle('2. 安全区域 (Padding)'),
                      _buildSafeAreaDemo(padding),

                      const SizedBox(height: 24),

                      // 场景 3: 响应式布局
                      _buildSectionTitle('3. 响应式布局适配'),
                      _buildResponsiveDemo(size),
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
  Widget _buildPropertyTable(MediaQueryData mediaQuery) {
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
            _buildTableCell('size'),
            _buildTableCell('Size'),
            _buildTableCell('屏幕物理尺寸（宽 x 高）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('devicePixelRatio'),
            _buildTableCell('double'),
            _buildTableCell('设备像素比（1.0/2.0/3.0）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('padding'),
            _buildTableCell('EdgeInsets'),
            _buildTableCell('安全区域边距（状态栏等）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('viewInsets'),
            _buildTableCell('EdgeInsets'),
            _buildTableCell('视图内边距（键盘等）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('orientation'),
            _buildTableCell('Orientation'),
            _buildTableCell('屏幕方向（portrait/landscape）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('textScaleFactor'),
            _buildTableCell('double'),
            _buildTableCell('文本缩放比例'),
          ],
        ),
      ],
    );
  }

  // 构建方法说明表格
  Widget _buildMethodTable() {
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
          decoration: BoxDecoration(color: Colors.green[50]),
          children: [
            _buildTableCell('方法', isHeader: true),
            _buildTableCell('说明', isHeader: true),
          ],
        ),
        // 方法行
        TableRow(
          children: [
            _buildTableCell('MediaQuery.of(context)'),
            _buildTableCell('从上下文获取 MediaQueryData'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('MediaQuery.removePadding()'),
            _buildTableCell('移除指定方向的内边距'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('MediaQuery.removeViewInsets()'),
            _buildTableCell('移除指定的视图内边距'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('MediaQuery.copyWith()'),
            _buildTableCell('复制并修改 MediaQueryData'),
          ],
        ),
      ],
    );
  }

  // 构建屏幕信息演示
  Widget _buildScreenInfoDemo(Size size) {
    final mediaQuery = MediaQuery.of(context);
    
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
          _buildInfoRow('屏幕宽度', '${size.width.toStringAsFixed(2)} px', Colors.blue),
          _buildInfoRow('屏幕高度', '${size.height.toStringAsFixed(2)} px', Colors.green),
          _buildInfoRow('设备像素比', '${mediaQuery.devicePixelRatio}', Colors.orange),
          _buildInfoRow('屏幕方向', mediaQuery.orientation == Orientation.portrait ? '纵向' : '横向', Colors.purple),
          _buildInfoRow('文本缩放', '${mediaQuery.textScaleFactor.toStringAsFixed(2)}x', Colors.teal),
        ],
      ),
    );
  }

  // 构建安全区域演示
  Widget _buildSafeAreaDemo(EdgeInsets padding) {
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
          const Text('安全区域边距（状态栏、导航栏等）', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          _buildInfoRow('顶部 (状态栏)', '${padding.top.toStringAsFixed(0)} px', Colors.red),
          _buildInfoRow('底部 (导航栏)', '${padding.bottom.toStringAsFixed(0)} px', Colors.blue),
          _buildInfoRow('左侧', '${padding.left.toStringAsFixed(0)} px', Colors.green),
          _buildInfoRow('右侧', '${padding.right.toStringAsFixed(0)} px', Colors.orange),
          
          const SizedBox(height: 16),
          
          // 可视化安全区域
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                // 安全区域示意
                Positioned(
                  top: padding.top > 0 ? 20 : 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '安全区域内内容',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建响应式布局演示
  Widget _buildResponsiveDemo(Size size) {
    // 根据屏幕宽度判断布局
    final isNarrow = size.width < 600;
    final isMedium = size.width >= 600 && size.width < 1200;
    final isWide = size.width >= 1200;
    
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
          const Text('根据屏幕宽度自动调整布局', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          
          // 布局类型指示器
          Row(
            children: [
              _buildLayoutBadge('手机 (<600)', isNarrow, Colors.red),
              const SizedBox(width: 8),
              _buildLayoutBadge('平板 (600-1200)', isMedium, Colors.orange),
              const SizedBox(width: 8),
              _buildLayoutBadge('桌面 (>1200)', isWide, Colors.green),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // 响应式布局演示
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: isNarrow ? Colors.red[50] : isMedium ? Colors.orange[50] : Colors.green[50],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isNarrow ? Colors.red! : isMedium ? Colors.orange! : Colors.green!,
              ),
            ),
            child: Center(
              child: Text(
                isNarrow ? '单列布局 (手机)' : isMedium ? '双列布局 (平板)' : '多列布局 (桌面)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isNarrow ? Colors.red : isMedium ? Colors.orange : Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建信息行
  Widget _buildInfoRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建布局标签
  Widget _buildLayoutBadge(String text, bool isActive, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? color : Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: isActive ? Colors.white : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
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
          color: isHeader ? Colors.blue[800] : Colors.black87,
        ),
      ),
    );
  }
}