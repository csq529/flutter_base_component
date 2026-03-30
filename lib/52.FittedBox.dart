import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FittedBoxDemo()));
}

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