import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FittedBoxDemo()));
}
/*
  FittedBox 是一个 Flutter 组件，它用于调整子组件的大小和位置，以适应父组件的约束条件。它通过 BoxFit 枚举来定义如何调整子组件的大小和位置。常见的 BoxFit 枚举值包括：
- BoxFit.contain：保持子组件的宽高比，尽可能大地适应父组件，但不会裁剪子组件。
- BoxFit.cover：保持子组件的宽高比，尽可能小地适应父组件，但可能会裁剪子组件。
- BoxFit.fill：拉伸子组件以完全填充父组件，可能会改变子组件的宽高比。
- BoxFit.fitHeight：保持子组件的宽高比，调整子组件的高度以适应父组件的高度，宽度会根据高度调整。
- BoxFit.fitWidth：保持子组件的宽高比，调整子组件的宽度以适应父组件的宽度，高度会根据宽度调整。
- BoxFit.none：不调整子组件的大小，子组件保持原始大小，可能会超出父组件。   


*/

class FittedBoxDemo extends StatefulWidget {
  const FittedBoxDemo({super.key});

  @override
  State<FittedBoxDemo> createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
  // 所有 BoxFit 枚举值
  final List<BoxFit> _boxFitValues = [
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.fitWidth,
    BoxFit.none,
    BoxFit.scaleDown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FittedBox Demo'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                '容器大小：150x150 | 图片大小：200x300',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // 网格展示所有 BoxFit 效果
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _boxFitValues.length,
                itemBuilder: (context, index) {
                  return _BoxFitItem(boxFit: _boxFitValues[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 单个 BoxFit 展示项
class _BoxFitItem extends StatelessWidget {
  final BoxFit boxFit;

  const _BoxFitItem({required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 展示容器
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: FittedBox(
              fit: boxFit,
              child: Image.network(
                'https://picsum.photos/200/300',
                width: 200,
                height: 300,
                fit: boxFit,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // 显示 BoxFit 名称
        Text(
          _getBoxFitName(boxFit),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 获取 BoxFit 名称
  String _getBoxFitName(BoxFit boxFit) {
    switch (boxFit) {
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fill:
        return 'fill';
      case BoxFit.fitHeight:
        return 'fitHeight';
      case BoxFit.fitWidth:
        return 'fitWidth';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scaleDown';
    }
  }
}