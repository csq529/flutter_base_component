import 'package:flutter/material.dart';

/// Dismissible 滑动删除组件演示
///
/// 用途：实现列表项的滑动删除功能
/// 支持方向：水平（左滑/右滑）或垂直滑动
class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({super.key});

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  // 模拟列表数据
  final List<String> _items = List.generate(10, (index) => '项目 $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        // 提前缓存当前项数据，避免删除后无法访问
        final item = _items[index];

        return Dismissible(
          // 【必填】唯一标识键，建议使用 ValueKey
          key: ValueKey(item),

          // 滑动方向配置
          direction: DismissDirection.endToStart,

          // 【必填】删除回调函数
          onDismissed: (direction) {
            // 从数据源中移除对应项
            setState(() {
              _items.removeAt(index);
            });

            // 显示提示消息
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // 使用缓存的 item 变量，而不是 _items[index]
                content: Text('已删除：$item'),
                action: SnackBarAction(
                  label: '撤销',
                  onPressed: () {
                    // 撤销逻辑：将原数据插回原位置
                    setState(() {
                      _items.insert(index, item);
                    });
                  },
                ),
              ),
            );
          },

          // 删除前的背景组件
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: const Icon(Icons.archive, color: Colors.white),
          ),

          // 删除确认后的背景组件
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.delete, color: Colors.white),
          ),

          // 确认删除前需要滑动的距离比例
          dismissThresholds: const {DismissDirection.endToStart: 0.5},

          // 列表项内容
          child: ListTile(
            leading: const Icon(Icons.list),
            title: Text(item),
            subtitle: const Text('滑动此项进行删除操作'),
            trailing: const Icon(Icons.drag_handle),
          ),
        );
      },
    );
  }
}
