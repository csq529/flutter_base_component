import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

// ============================================================================
// LimitedBox 限制盒子组件演示
// ============================================================================

/// [LimitedBoxDemo] 是 LimitedBox 组件的完整演示页面
/// 
/// **用途**：
/// 1. 展示如何在 ScrollView 中限制子组件的最大尺寸
/// 2. 演示 LimitedBox 与普通 Container 的区别
/// 3. 提供常见场景的使用示例（列表项、卡片等）
/// 
/// **特点**：
/// - 包含多个实际使用场景示例
/// - 提供属性说明表格和源代码查看功能
/// - 对比展示有无 LimitedBox 的效果差异
/// - 统一的卡片式布局，便于学习和参考
class LimitedBoxDemo extends StatefulWidget {
  const LimitedBoxDemo({super.key});

  @override
  State<LimitedBoxDemo> createState() => _LimitedBoxDemoState();
}

class _LimitedBoxDemoState extends State<LimitedBoxDemo> {
  // ==========================================================================
  // 成员变量
  // ==========================================================================
  
  /// [_showLimitedBox] 是否显示 LimitedBox 限制
  /// 用于对比演示有无限制的效果
  bool _showLimitedBox = true;

  /// [_maxHeight] 最大高度限制值
  double _maxHeight = 200.0;

  /// [_maxWidth] 最大宽度限制值
  double _maxWidth = 300.0;

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
              // 核心概念说明
              _buildConceptExplanation(),
              const SizedBox(height: 24),
              // 动态调整区域
              _buildDynamicAdjustment(),
              const SizedBox(height: 24),
              // 对比演示区域
              _buildComparisonDemo(),
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
  /// 使用 [Table] 组件展示 LimitedBox 的核心属性和说明
  Widget _buildPropertyTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 LimitedBox 属性说明',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1),    // 属性名列
              1: FlexColumnWidth(1),    // 类型列
              2: FlexColumnWidth(2),    // 说明列
            },
            children: [
              _buildTableRow('属性', '类型', '说明'),
              _buildTableRow('maxWidth', 'double?', '最大宽度限制（可选）'),
              _buildTableRow('maxHeight', 'double?', '最大高度限制（可选）'),
              _buildTableRow('child', 'Widget', '子组件，会被应用尺寸限制'),
              _buildTableRow('key', 'Key?', '组件的唯一标识符'),
              _buildTableRow('无约束', '场景', '父组件无最大约束时才生效'),
              _buildTableRow('ScrollView', '场景', '常用于列表、滚动视图'),
              _buildTableRow('Container', '对比', 'Container 始终应用约束'),
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

  /// [_buildConceptExplanation] 构建核心概念说明
  Widget _buildConceptExplanation() {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💡 核心概念',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildConceptItem(
              icon: Icons.check_circle,
              color: Colors.green,
              title: '何时生效',
              description: '只有当父组件没有提供最大约束时，LimitedBox 才会应用限制',
            ),
            const SizedBox(height: 8),
            _buildConceptItem(
              icon: Icons.warning,
              color: Colors.orange,
              title: '常见误区',
              description: '在有固定大小的容器中，LimitedBox 不会生效',
            ),
            const SizedBox(height: 8),
            _buildConceptItem(
              icon: Icons.lightbulb,
              color: Colors.blue,
              title: '最佳场景',
              description: 'ScrollView、ListView 等滚动容器中防止子组件无限扩展',
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildConceptItem] 构建概念说明项
  Widget _buildConceptItem({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ],
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
              '🎚️ 动态调整限制值',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 最大高度滑块
            Row(
              children: [
                const Text('最大高度:', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _maxHeight,
                    min: 50,
                    max: 400,
                    divisions: 35,
                    label: _maxHeight.toStringAsFixed(0),
                    onChanged: (value) {
                      setState(() {
                        _maxHeight = value;
                      });
                    },
                  ),
                ),
                Text(
                  '${_maxHeight.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // 最大宽度滑块
            Row(
              children: [
                const Text('最大宽度:', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _maxWidth,
                    min: 100,
                    max: 400,
                    divisions: 30,
                    label: _maxWidth.toStringAsFixed(0),
                    onChanged: (value) {
                      setState(() {
                        _maxWidth = value;
                      });
                    },
                  ),
                ),
                Text(
                  '${_maxWidth.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 切换开关
            SwitchListTile(
              title: const Text('启用 LimitedBox 限制'),
              subtitle: const Text('关闭后子组件将不受限制'),
              value: _showLimitedBox,
              onChanged: (value) {
                setState(() {
                  _showLimitedBox = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // 预览区域
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _showLimitedBox
                  ? LimitedBox(
                      maxWidth: _maxWidth,
                      maxHeight: _maxHeight,
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'LimitedBox 生效',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          '无限制',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildComparisonDemo] 构建对比演示区域
  Widget _buildComparisonDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔄 对比演示：ScrollView 中的效果',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '在 ScrollView 中，子组件倾向于无限扩展，LimitedBox 可以限制它们',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // 使用 LimitedBox
            _buildComparisonItem(
              title: '✅ 使用 LimitedBox',
              child: SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    LimitedBox(
                      maxWidth: 100,
                      child: Container(
                        width: 500, // 尝试设置很大的宽度
                        height: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            '被限制\n100px',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    LimitedBox(
                      maxWidth: 100,
                      child: Container(
                        width: 500,
                        height: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            '被限制\n100px',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    LimitedBox(
                      maxWidth: 100,
                      child: Container(
                        width: 500,
                        height: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            '被限制\n100px',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 不使用 LimitedBox
            _buildComparisonItem(
              title: '❌ 不使用 LimitedBox',
              child: SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 200, // 没有 LimitedBox，宽度会生效
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          '无限制\n200px',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          '无限制\n200px',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          '无限制\n200px',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildComparisonItem] 构建对比项
  Widget _buildComparisonItem({
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
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
            // 场景 1: 列表项卡片
            _buildScenarioCard(
              title: '列表项卡片',
              description: '限制卡片最大高度，防止内容过多',
              icon: Icons.list,
              color: Colors.blue,
              child: LimitedBox(
                maxHeight: 80,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '这是一个列表项，高度被限制为 80px，即使内容很多也不会无限扩展',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 场景 2: 横向滚动图片
            _buildScenarioCard(
              title: '横向滚动图片',
              description: '限制图片最大宽度，保持整齐布局',
              icon: Icons.image,
              color: Colors.green,
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    LimitedBox(
                      maxWidth: 120,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        color: Colors.green.shade200,
                        child: const Icon(Icons.photo, size: 48),
                      ),
                    ),
                    LimitedBox(
                      maxWidth: 120,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        color: Colors.green.shade200,
                        child: const Icon(Icons.photo, size: 48),
                      ),
                    ),
                    LimitedBox(
                      maxWidth: 120,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        color: Colors.green.shade200,
                        child: const Icon(Icons.photo, size: 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 场景 3: 响应式布局
            _buildScenarioCard(
              title: '响应式布局',
              description: '在大屏幕上限制内容最大宽度',
              icon: Icons.devices,
              color: Colors.orange,
              child: LimitedBox(
                maxWidth: 300,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '内容区域最大宽度限制为 300px，在大屏幕上保持美观',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [_buildScenarioCard] 构建场景卡片
  Widget _buildScenarioCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  /// [_getSourceCode] 获取源代码字符串
  String _getSourceCode() {
    return '''
// LimitedBox 核心使用示例
import 'package:flutter/material.dart';

class LimitedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox 演示')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 示例 1: 限制最大高度
            LimitedBox(
              maxHeight: 200,
              child: Container(
                color: Colors.blue,
                child: Text('最大高度 200px'),
              ),
            ),
            
            // 示例 2: 限制最大宽度
            LimitedBox(
              maxWidth: 300,
              child: Container(
                color: Colors.red,
                child: Text('最大宽度 300px'),
              ),
            ),
            
            // 示例 3: 在 ScrollView 中使用
            SingleChildScrollView(
              child: Column(
                children: [
                  LimitedBox(
                    maxHeight: 100,
                    child: ListTile(
                      title: Text('列表项'),
                      subtitle: Text('高度被限制'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 注意事项：
// 1. LimitedBox 只在父组件无最大约束时生效
// 2. 常用于 ScrollView、ListView 等滚动容器
// 3. 与 Container 的 constraints 不同，LimitedBox 更轻量
''';
  }
}

// ============================================================================
// 使用示例：列表项卡片组件
// ============================================================================

/// [ListItemCard] 演示 LimitedBox 在列表中的实际应用
/// 
/// **用途**：创建高度受限的列表项卡片
/// **特点**：防止内容过多导致卡片无限扩展
class ListItemCard extends StatelessWidget {
  final String title;
  final String content;
  final double maxHeight;

  const ListItemCard({
    super.key,
    required this.title,
    required this.content,
    this.maxHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: LimitedBox(
        maxHeight: maxHeight,
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
              const SizedBox(height: 8),
              Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 使用示例：横向滚动图片组件
// ============================================================================

/// [HorizontalImageScroll] 演示 LimitedBox 在横向滚动中的应用
/// 
/// **用途**：创建宽度受限的横向滚动图片列表
/// **特点**：确保每个图片项宽度一致，布局整齐
class HorizontalImageScroll extends StatelessWidget {
  final List<String> images;
  final double itemWidth;

  const HorizontalImageScroll({
    super.key,
    required this.images,
    this.itemWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: LimitedBox(
              maxWidth: itemWidth,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, size: 48),
              ),
            ),
          );
        },
      ),
    );
  }
}