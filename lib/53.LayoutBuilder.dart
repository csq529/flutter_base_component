import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LayoutBuilderDemo()));
}

class LayoutBuilderDemo extends StatefulWidget {
  const LayoutBuilderDemo({super.key});

  @override
  State<LayoutBuilderDemo> createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Demo'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 示例 1: 基础用法
              _buildSectionTitle('示例 1: 基础用法'),
              _Example1(),
              const SizedBox(height: 24),

              // 示例 2: 响应式布局
              _buildSectionTitle('示例 2: 响应式布局'),
              _Example2(),
              const SizedBox(height: 24),

              // 示例 3: 动态显示/隐藏
              _buildSectionTitle('示例 3: 动态显示/隐藏'),
              _Example3(),
              const SizedBox(height: 24),

              // 示例 4: 自适应网格
              _buildSectionTitle('示例 4: 自适应网格'),
              _Example4(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ==================== 示例 1: 基础用法 ====================
class _Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Text(
              '容器宽度：${constraints.maxWidth.toStringAsFixed(0)}\n'
              '容器高度：${constraints.maxHeight.toStringAsFixed(0)}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}

// ==================== 示例 2: 响应式布局 ====================
class _Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 根据宽度决定布局
          if (constraints.maxWidth < 300) {
            // 窄屏：垂直布局
            return Column(
              children: [
                _buildResponsiveItem(Icons.phone, '电话', Colors.red),
                _buildResponsiveItem(Icons.email, '邮箱', Colors.blue),
                _buildResponsiveItem(Icons.location_on, '地址', Colors.green),
              ],
            );
          } else {
            // 宽屏：水平布局
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildResponsiveItem(Icons.phone, '电话', Colors.red),
                _buildResponsiveItem(Icons.email, '邮箱', Colors.blue),
                _buildResponsiveItem(Icons.location_on, '地址', Colors.green),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildResponsiveItem(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// ==================== 示例 3: 动态显示/隐藏 ====================
class _Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.orange),
                const SizedBox(width: 12),
                const Text('基本信息'),
                // 宽度足够时显示更多内容
                if (constraints.maxWidth > 200) ...[
                  const SizedBox(width: 12),
                  const Text('• 详细描述111'),
                ],
                if (constraints.maxWidth > 400) ...[
                  const SizedBox(width: 12),
                  const Text('• 详细描述'),
                ],
                if (constraints.maxWidth > 500) ...[
                  const SizedBox(width: 12),
                  const Text('• 附加信息'),
                ],
                if (constraints.maxWidth > 600) ...[
                  const SizedBox(width: 12),
                  const Text('• 更多内容'),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== 示例 4: 自适应网格 ====================
class _Example4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 根据宽度计算列数
          int crossAxisCount = (constraints.maxWidth / 100).floor();
          crossAxisCount = crossAxisCount.clamp(1, 4);

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.purple[100],
                child: Center(child: Text('Item ${index + 1}')),
              );
            },
          );
        },
      ),
    );
  }
}