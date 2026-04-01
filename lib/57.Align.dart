import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// ============================================================================
/// Align 组件说明
/// ============================================================================
/// 
/// 【用途】: 控制子组件在父容器中的**对齐方式**
/// 
/// 【特点】:
/// 1. 不会改变子组件的大小，只改变其位置
/// 2. 使用 Alignment 类来指定对齐位置
/// 3. 可以通过 widthFactor/heightFactor 控制自身大小
/// 4. 是单组件布局，只能有一个子组件
/// 
/// 【常见场景】:
/// - 将按钮放置在容器右下角
/// - 将图标居中对齐
/// - 将文本靠顶部对齐
/// - 精确控制组件位置
/// 
/// 【Alignment 常用值】:
/// - Alignment.center      居中
/// - Alignment.topLeft     左上角
/// - Alignment.topCenter   顶部居中
/// - Alignment.topRight    右上角
/// - Alignment.centerLeft  左侧居中
/// - Alignment.centerRight 右侧居中
/// - Alignment.bottomLeft  左下角
/// - Alignment.bottomCenter 底部居中
/// - Alignment.bottomRight  右下角
/// 
/// ============================================================================

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

/// ============================================================================
/// Align 组件说明
/// ============================================================================
/// 
/// 【用途】: 控制子组件在父容器中的**对齐方式**
/// 
/// 【特点】:
/// 1. 不会改变子组件的大小，只改变其位置
/// 2. 使用 Alignment 类来指定对齐位置
/// 3. 可以通过 widthFactor/heightFactor 控制自身大小
/// 4. 是单组件布局，只能有一个子组件
/// 
/// 【常见场景】:
/// - 将按钮放置在容器右下角
/// - 将图标居中对齐
/// - 将文本靠顶部对齐
/// - 精确控制组件位置
/// 
/// 【Alignment 常用值】:
/// - Alignment.center      居中
/// - Alignment.topLeft     左上角
/// - Alignment.topCenter   顶部居中
/// - Alignment.topRight    右上角
/// - Alignment.centerLeft  左侧居中
/// - Alignment.centerRight 右侧居中
/// - Alignment.bottomLeft  左下角
/// - Alignment.bottomCenter 底部居中
/// - Alignment.bottomRight  右下角
/// 
/// ============================================================================

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align 组件演示'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================================
            // 示例 1: 基础用法 - 九宫格对齐演示
            // ======================================================================
            _buildSectionTitle('示例 1: 九宫格对齐位置'),
            _buildAlignmentGrid(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 2: widthFactor 和 heightFactor 用法
            // ======================================================================
            _buildSectionTitle('示例 2: 控制 Align 自身大小'),
            _buildFactorDemo(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 3: 实际应用场景
            // ======================================================================
            _buildSectionTitle('示例 3: 实际应用场景'),
            _buildPracticalExamples(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 4: Alignment 自定义值
            // ======================================================================
            _buildSectionTitle('示例 4: 自定义 Alignment 值'),
            _buildCustomAlignment(),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // 构建章节标题
  // ============================================================================
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  // ============================================================================
  // 示例 1: 九宫格对齐位置演示
  // ============================================================================
  Widget _buildAlignmentGrid() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 背景网格线（辅助显示）
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(),
            ),
          ),
          
          // 9 个不同对齐位置的示例
          _buildAlignmentItem(Alignment.topLeft, '左上', Colors.red),
          _buildAlignmentItem(Alignment.topCenter, '上中', Colors.orange),
          _buildAlignmentItem(Alignment.topRight, '右上', Colors.yellow),
          _buildAlignmentItem(Alignment.centerLeft, '左中', Colors.green),
          _buildAlignmentItem(Alignment.center, '中心', Colors.blue),
          _buildAlignmentItem(Alignment.centerRight, '右中', Colors.purple),
          _buildAlignmentItem(Alignment.bottomLeft, '左下', Colors.pink),
          _buildAlignmentItem(Alignment.bottomCenter, '下中', Colors.brown),
          _buildAlignmentItem(Alignment.bottomRight, '右下', Colors.teal),
        ],
      ),
    );
  }

  Widget _buildAlignmentItem(Alignment alignment, String label, Color color) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // 示例 2: widthFactor 和 heightFactor 演示
  // ============================================================================
  Widget _buildFactorDemo() {
    return Column(
      children: [
        // 默认情况 - Align 包裹子组件
        _buildFactorItem(
          title: '默认 (无 factor)',
          description: 'Align 大小 = 子组件大小',
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              child: const Center(
                child: Text('子组件', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // widthFactor = 0.5 - Align 宽度 = 父容器宽度 * 0.5
        _buildFactorItem(
          title: 'widthFactor = 0.5',
          description: 'Align 宽度 = 父容器宽度 × 0.5',
          child: Align(
            alignment: Alignment.center,
            widthFactor: 0.5,  // Align 宽度占父容器的 50%
            child: Container(
              width: 100,
              height: 50,
              color: Colors.green,
              child: const Center(
                child: Text('子组件', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // heightFactor = 0.3 - Align 高度 = 父容器高度 * 0.3
        _buildFactorItem(
          title: 'heightFactor = 0.3',
          description: 'Align 高度 = 父容器高度 × 0.3',
          child: SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              heightFactor: 0.3,  // Align 高度占父容器的 30%
              child: Container(
                width: 100,
                height: 50,
                color: Colors.orange,
                child: const Center(
                  child: Text('子组件', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFactorItem({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 8),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, style: BorderStyle.solid),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 3: 实际应用场景
  // ============================================================================
  Widget _buildPracticalExamples() {
    return Column(
      children: [
        // 场景 1: 卡片右上角关闭按钮
        _buildScenarioCard(
          title: '场景 1: 卡片右上角关闭按钮',
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('卡片标题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('这是卡片内容...', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                // 使用 Align 将关闭按钮放在右上角
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // 场景 2: 底部固定按钮
        _buildScenarioCard(
          title: '场景 2: 底部固定操作按钮',
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('表单内容', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(decoration: InputDecoration(hintText: '请输入...')),
                    ],
                  ),
                ),
                // 使用 Align 将按钮放在底部居中
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('提交'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScenarioCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 4: 自定义 Alignment 值
  // ============================================================================
  Widget _buildCustomAlignment() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 自定义 Alignment(0.7, -0.5)
          // x: 0.7 表示从左到右 70% 的位置
          // y: -0.5 表示从上到下 -50% 的位置（负数表示向上偏移）
          Align(
            alignment: const Alignment(0.7, -0.5),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Alignment(0.7, -0.5)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          // 自定义 Alignment(-0.3, 0.8)
          Align(
            alignment: const Alignment(-0.3, 0.8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Alignment(-0.3, 0.8)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 网格绘制器 - 用于绘制背景辅助线
// ============================================================================
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // 绘制垂直中线
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // 绘制水平中线
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void main() {
  runApp(const MaterialApp(home: AlignDemo()));
}''',
      demoBuilder: () => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======================================================================
              // 示例 1: 基础用法 - 九宫格对齐演示
              // ======================================================================
              _buildSectionTitle('示例 1: 九宫格对齐位置'),
              _buildAlignmentGrid(),
              
              const SizedBox(height: 24),
              
              // ======================================================================
              // 示例 2: widthFactor 和 heightFactor 用法
              // ======================================================================
              _buildSectionTitle('示例 2: 控制 Align 自身大小'),
              _buildFactorDemo(),
              
              const SizedBox(height: 24),
              
              // ======================================================================
              // 示例 3: 实际应用场景
              // ======================================================================
              _buildSectionTitle('示例 3: 实际应用场景'),
              _buildPracticalExamples(),
              
              const SizedBox(height: 24),
              
              // ======================================================================
              // 示例 4: Alignment 自定义值
              // ======================================================================
              _buildSectionTitle('示例 4: 自定义 Alignment 值'),
              _buildCustomAlignment(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // 构建章节标题
  // ============================================================================
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  // ============================================================================
  // 示例 1: 九宫格对齐位置演示
  // ============================================================================
  Widget _buildAlignmentGrid() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 背景网格线（辅助显示）
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(),
            ),
          ),
          
          // 9 个不同对齐位置的示例
          _buildAlignmentItem(Alignment.topLeft, '左上', Colors.red),
          _buildAlignmentItem(Alignment.topCenter, '上中', Colors.orange),
          _buildAlignmentItem(Alignment.topRight, '右上', Colors.yellow),
          _buildAlignmentItem(Alignment.centerLeft, '左中', Colors.green),
          _buildAlignmentItem(Alignment.center, '中心', Colors.blue),
          _buildAlignmentItem(Alignment.centerRight, '右中', Colors.purple),
          _buildAlignmentItem(Alignment.bottomLeft, '左下', Colors.pink),
          _buildAlignmentItem(Alignment.bottomCenter, '下中', Colors.brown),
          _buildAlignmentItem(Alignment.bottomRight, '右下', Colors.teal),
        ],
      ),
    );
  }

  Widget _buildAlignmentItem(Alignment alignment, String label, Color color) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // 示例 2: widthFactor 和 heightFactor 演示
  // ============================================================================
  Widget _buildFactorDemo() {
    return Column(
      children: [
        // 默认情况 - Align 包裹子组件
        _buildFactorItem(
          title: '默认 (无 factor)',
          description: 'Align 大小 = 子组件大小',
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              child: const Center(
                child: Text('子组件', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // widthFactor = 0.5 - Align 宽度 = 父容器宽度 * 0.5
        _buildFactorItem(
          title: 'widthFactor = 0.5',
          description: 'Align 宽度 = 父容器宽度 × 0.5',
          child: Align(
            alignment: Alignment.center,
            widthFactor: 0.5,  // Align 宽度占父容器的 50%
            child: Container(
              width: 100,
              height: 50,
              color: Colors.green,
              child: const Center(
                child: Text('子组件', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // heightFactor = 0.3 - Align 高度 = 父容器高度 * 0.3
        _buildFactorItem(
          title: 'heightFactor = 0.3',
          description: 'Align 高度 = 父容器高度 × 0.3',
          child: SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              heightFactor: 0.3,  // Align 高度占父容器的 30%
              child: Container(
                width: 100,
                height: 50,
                color: Colors.orange,
                child: const Center(
                  child: Text('子组件', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFactorItem({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 8),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, style: BorderStyle.solid),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 3: 实际应用场景
  // ============================================================================
  Widget _buildPracticalExamples() {
    return Column(
      children: [
        // 场景 1: 卡片右上角关闭按钮
        _buildScenarioCard(
          title: '场景 1: 卡片右上角关闭按钮',
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('卡片标题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('这是卡片内容...', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                // 使用 Align 将关闭按钮放在右上角
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // 场景 2: 底部固定按钮
        _buildScenarioCard(
          title: '场景 2: 底部固定操作按钮',
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('表单内容', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(decoration: InputDecoration(hintText: '请输入...')),
                    ],
                  ),
                ),
                // 使用 Align 将按钮放在底部居中
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('提交'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScenarioCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 4: 自定义 Alignment 值
  // ============================================================================
  Widget _buildCustomAlignment() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 自定义 Alignment(0.7, -0.5)
          // x: 0.7 表示从左到右 70% 的位置
          // y: -0.5 表示从上到下 -50% 的位置（负数表示向上偏移）
          Align(
            alignment: const Alignment(0.7, -0.5),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Alignment(0.7, -0.5)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          // 自定义 Alignment(-0.3, 0.8)
          Align(
            alignment: const Alignment(-0.3, 0.8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Alignment(-0.3, 0.8)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 网格绘制器 - 用于绘制背景辅助线
// ============================================================================
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // 绘制垂直中线
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // 绘制水平中线
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void main() {
  runApp(const MaterialApp(home: AlignDemo()));
}
