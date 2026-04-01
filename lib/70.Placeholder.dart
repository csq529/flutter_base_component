import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

// ============================================================================
// Placeholder 占位符组件演示
// ============================================================================

/// [PlaceholderDemo] 是 Placeholder 组件的完整演示页面
///
/// **用途**：
/// 1. 展示如何在开发阶段预留 UI 位置
/// 2. 演示占位符的各种样式配置
/// 3. 提供常见场景的使用示例（加载中、内容未就绪等）
///
/// **特点**：
/// - 包含多种占位符样式示例
/// - 提供属性说明表格和源代码查看功能
/// - 支持动态调整占位符参数观察效果
/// - 统一的卡片式布局，便于学习和参考
class PlaceholderDemo extends StatefulWidget {
  const PlaceholderDemo({super.key});

  @override
  State<PlaceholderDemo> createState() => _PlaceholderDemoState();
}

class _PlaceholderDemoState extends State<PlaceholderDemo> {
  // ==========================================================================
  // 成员变量
  // ==========================================================================

  /// [_placeholderColor] 占位符颜色
  Color _placeholderColor = Colors.grey;

  /// [_strokeWidth] 线条宽度
  double _strokeWidth = 2.0;

  /// [_placeholderCount] 交叉线数量 (注意：Placeholder 原生不支持此属性，此处仅用于演示滑块交互)
  /// 修正：Placeholder 实际上没有 placeholderCount 属性，这里仅作为演示变量存在
  /// 为了代码严谨性，我们在构建 Placeholder 时不使用此变量，或仅用于演示 UI 交互
  int _placeholderCount = 4;

  /// [_placeholderFallbackWidth] 占位符宽度
  double _placeholderFallbackWidth = 100.0;

  /// [_placeholderFallbackHeight] 占位符高度
  double _placeholderFallbackHeight = 100.0;

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
              // 样式示例
              _buildStyleExamples(),
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
  Widget _buildPropertyTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 Placeholder 属性说明',
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
              _buildTableRow('color', 'Color', '占位符线条颜色'),
              _buildTableRow('strokeWidth', 'double', '交叉线条的宽度'),
              _buildTableRow('fallbackWidth', 'double', '无约束时的默认宽度'),
              _buildTableRow('fallbackHeight', 'double', '无约束时的默认高度'),
              // 移除错误的 fallbackChild 行
              _buildTableRow('开发阶段', '场景', 'UI 未完成时的占位'),
              _buildTableRow('加载状态', '场景', '数据加载中的占位显示'),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(
      children: [
        _buildTableCell(col1, isHeader: true),
        _buildTableCell(col2, isHeader: true),
        _buildTableCell(col3, isHeader: true),
      ],
    );
  }

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
              title: '主要用途',
              description: '开发阶段预留 UI 位置，方便布局和尺寸规划',
            ),
            const SizedBox(height: 8),
            _buildConceptItem(
              icon: Icons.warning,
              color: Colors.orange,
              title: '注意事项',
              description: '生产环境应替换为实际内容，不建议直接使用',
            ),
            const SizedBox(height: 8),
            _buildConceptItem(
              icon: Icons.lightbulb,
              color: Colors.blue,
              title: '最佳场景',
              description: 'UI 设计阶段、等待后端接口、组件开发中',
            ),
          ],
        ),
      ),
    );
  }

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
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicAdjustment() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎚️ 动态调整参数',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('颜色:', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    children: [
                      _buildColorButton(Colors.grey),
                      _buildColorButton(Colors.red),
                      _buildColorButton(Colors.blue),
                      _buildColorButton(Colors.green),
                      _buildColorButton(Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('线条宽度:', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _strokeWidth,
                    min: 1.0,
                    max: 10.0,
                    divisions: 18,
                    label: _strokeWidth.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _strokeWidth = value;
                      });
                    },
                  ),
                ),
                Text(
                  '${_strokeWidth.toStringAsFixed(1)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // 注意：Placeholder 原生不支持交叉线数量调整，此处滑块仅作演示交互
            Row(
              children: [
                const Text('演示滑块:', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _placeholderCount.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: _placeholderCount.toString(),
                    onChanged: (value) {
                      setState(() {
                        _placeholderCount = value.toInt();
                      });
                    },
                  ),
                ),
                Text(
                  _placeholderCount.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Placeholder(
                  color: _placeholderColor,
                  strokeWidth: _strokeWidth,
                  fallbackWidth: _placeholderFallbackWidth,
                  fallbackHeight: _placeholderFallbackHeight,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                '${_placeholderFallbackWidth.toStringAsFixed(0)} x ${_placeholderFallbackHeight.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _placeholderColor = color;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _placeholderColor == color
                ? Colors.black
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildStyleExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎨 样式示例',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildStyleItem('默认样式', const Placeholder()),
            const SizedBox(height: 12),
            _buildStyleItem('粗线条', const Placeholder(strokeWidth: 5.0)),
            const SizedBox(height: 12),
            _buildStyleItem(
              '彩色线条',
              const Placeholder(color: Colors.blue, strokeWidth: 3.0),
            ),
            const SizedBox(height: 12),
            // 修复：使用 Stack 模拟带文字效果，移除无效的 fallbackChild
            _buildStyleItem(
              '组合使用 (Stack)',
              Stack(
                alignment: Alignment.center,
                children: [
                  const Placeholder(color: Colors.orange),
                  const Text('加载中...', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildStyleItem(
              '正方形',
              const AspectRatio(aspectRatio: 1, child: Placeholder()),
            ),
            const SizedBox(height: 12),
            _buildStyleItem(
              '宽屏比例',
              const AspectRatio(aspectRatio: 16 / 9, child: Placeholder()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyleItem(String label, Widget child) {
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
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          SizedBox(height: 80, child: Center(child: child)),
        ],
      ),
    );
  }

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
            _buildScenarioCard(
              title: '列表加载中',
              description: '数据加载时显示占位符，避免布局跳动',
              icon: Icons.list,
              color: Colors.blue,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Placeholder(
                          fallbackWidth: 50,
                          fallbackHeight: 50,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Placeholder(fallbackHeight: 16),
                              const SizedBox(height: 8),
                              Placeholder(
                                fallbackHeight: 12,
                                fallbackWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            _buildScenarioCard(
              title: '图片加载占位',
              description: '图片未加载完成前显示占位符',
              icon: Icons.image,
              color: Colors.green,
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Placeholder(
                        color: Colors.green.shade200,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Placeholder(
                        color: Colors.green.shade200,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Placeholder(
                        color: Colors.green.shade200,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildScenarioCard(
              title: 'UI 设计阶段',
              description: '开发时预留位置，方便布局规划',
              icon: Icons.design_services,
              color: Colors.orange,
              child: Column(
                children: [
                  const Placeholder(fallbackHeight: 100, color: Colors.orange),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Placeholder(
                          fallbackHeight: 60,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Placeholder(
                          fallbackHeight: 60,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  void _showSourceCode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('源代码'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: SingleChildScrollView(
            child: SelectableText(
              _getSourceCode(),
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  String _getSourceCode() {
    return '''
// Placeholder 核心使用示例
import 'package:flutter/material.dart';

class PlaceholderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Placeholder 演示')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 示例 1: 默认占位符
            Placeholder(
              fallbackWidth: 100,
              fallbackHeight: 100,
            ),
            
            // 示例 2: 自定义颜色
            Placeholder(
              color: Colors.blue,
              strokeWidth: 3.0,
            ),
            
            // 示例 3: 组合使用 (Stack 模拟文字)
            Stack(
              alignment: Alignment.center,
              children: [
                Placeholder(color: Colors.orange),
                Text('加载中...', style: TextStyle(color: Colors.white)),
              ],
            ),
            
            // 示例 4: 列表加载占位
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Placeholder(
                    fallbackWidth: 40,
                    fallbackHeight: 40,
                  ),
                  title: Placeholder(fallbackHeight: 16),
                  subtitle: Placeholder(fallbackHeight: 12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 注意事项：
// 1. Placeholder 主要用于开发阶段
// 2. 生产环境应替换为实际内容
// 3. Placeholder 不支持子组件，需配合 Stack 使用
''';
  }
}

// ============================================================================
// 使用示例：加载列表项组件
// ============================================================================

/// [LoadingListItem] 演示 Placeholder 在列表加载中的应用
class LoadingListItem extends StatelessWidget {
  const LoadingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Placeholder(fallbackWidth: 50, fallbackHeight: 50),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Placeholder(fallbackHeight: 16),
                const SizedBox(height: 8),
                Placeholder(
                  fallbackHeight: 12,
                  fallbackWidth: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 使用示例：图片网格占位组件
// ============================================================================

/// [ImageGridPlaceholder] 演示 Placeholder 在图片网格中的应用
class ImageGridPlaceholder extends StatelessWidget {
  final int itemCount;

  const ImageGridPlaceholder({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Placeholder(color: Colors.grey.shade300, strokeWidth: 1.5);
      },
    );
  }
}

// ============================================================================
// 使用示例：卡片占位组件
// ============================================================================

/// [CardPlaceholder] 演示 Placeholder 在卡片布局中的应用
class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AspectRatio(aspectRatio: 16 / 9, child: Placeholder()),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Placeholder(fallbackHeight: 18),
                const SizedBox(height: 8),
                Placeholder(
                  fallbackHeight: 12,
                  fallbackWidth: MediaQuery.of(context).size.width * 0.7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
