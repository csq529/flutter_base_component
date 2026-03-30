import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TransformDemo()));
}

class TransformDemo extends StatefulWidget {
  const TransformDemo({super.key});

  @override
  State<TransformDemo> createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  // 变换参数
  double _rotateAngle = 0.0;      // 旋转角度
  double _scaleX = 1.0;           // X 轴缩放
  double _scaleY = 1.0;           // Y 轴缩放
  double _translateX = 0.0;       // X 轴平移
  double _translateY = 0.0;       // Y 轴平移
  double _skewX = 0.0;            // X 轴倾斜
  double _skewY = 0.0;            // Y 轴倾斜
  
  // 控制选项
  bool _useOrigin = false;        // 是否使用自定义原点
  Alignment _alignment = Alignment.center;  // 对齐方式

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 变换效果展示区域
              _buildPreviewArea(),
              
              const Divider(height: 32),
              
              // 控制面板
              _buildControlPanel(),
            ],
          ),
        ),
      ),
    );
  }

  // 预览区域
  Widget _buildPreviewArea() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Center(
        child: Transform(
          alignment: _alignment,
          origin: _useOrigin ? const Offset(50, 50) : null,
          transform: Matrix4.identity()
            ..rotateZ(_rotateAngle)
            ..scale(_scaleX, _scaleY)
            ..translate(_translateX, _translateY),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Box',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 控制面板
  Widget _buildControlPanel() {
    return Column(
      children: [
        _buildSlider('旋转 (Rotate)', _rotateAngle, -3.14, 3.14, (v) => setState(() => _rotateAngle = v)),
        _buildSlider('缩放 X (Scale X)', _scaleX, 0.5, 2.0, (v) => setState(() => _scaleX = v)),
        _buildSlider('缩放 Y (Scale Y)', _scaleY, 0.5, 2.0, (v) => setState(() => _scaleY = v)),
        _buildSlider('平移 X (Translate X)', _translateX, -100, 100, (v) => setState(() => _translateX = v)),
        _buildSlider('平移 Y (Translate Y)', _translateY, -100, 100, (v) => setState(() => _translateY = v)),
        _buildSlider('倾斜 X (Skew X)', _skewX, -1.0, 1.0, (v) => setState(() => _skewX = v)),
        _buildSlider('倾斜 Y (Skew Y)', _skewY, -1.0, 1.0, (v) => setState(() => _skewY = v)),
        
        const SizedBox(height: 16),
        
        // 对齐方式选择
        DropdownButtonFormField<Alignment>(
          value: _alignment,
          decoration: const InputDecoration(labelText: '对齐方式 (Alignment)'),
          items: const [
            DropdownMenuItem(value: Alignment.center, child: Text('中心 (Center)')),
            DropdownMenuItem(value: Alignment.topLeft, child: Text('左上 (TopLeft)')),
            DropdownMenuItem(value: Alignment.topRight, child: Text('右上 (TopRight)')),
            DropdownMenuItem(value: Alignment.bottomLeft, child: Text('左下 (BottomLeft)')),
            DropdownMenuItem(value: Alignment.bottomRight, child: Text('右下 (BottomRight)')),
          ],
          onChanged: (v) => setState(() => _alignment = v!),
        ),
        
        const SizedBox(height: 8),
        
        // 自定义原点开关
        SwitchListTile(
          title: const Text('使用自定义原点 (Origin)'),
          subtitle: const Text('Offset(50, 50)'),
          value: _useOrigin,
          onChanged: (v) => setState(() => _useOrigin = v),
        ),
        
        const SizedBox(height: 16),
        
        // 重置按钮
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _rotateAngle = 0.0;
              _scaleX = 1.0;
              _scaleY = 1.0;
              _translateX = 0.0;
              _translateY = 0.0;
              _skewX = 0.0;
              _skewY = 0.0;
              _alignment = Alignment.center;
              _useOrigin = false;
            });
          },
          icon: const Icon(Icons.refresh),
          label: const Text('重置所有参数'),
        ),
      ],
    );
  }

  // 滑块组件
  Widget _buildSlider(String label, double value, double min, double max, Function(double) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontSize: 12))),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: 100,
              label: value.toStringAsFixed(2),
              onChanged: onChanged,
            ),
          ),
          SizedBox(width: 50, child: Text(value.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}