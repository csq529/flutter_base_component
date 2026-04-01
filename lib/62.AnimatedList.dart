import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

/// AnimatedList 动画列表组件演示
///
/// **用途**：
/// 1. 实现列表项添加/删除的平滑动画
/// 2. 支持动态插入、移除操作
/// 3. 适合聊天消息、待办事项、动态数据列表
/// 4. 提供比 ListView 更丰富的动画效果
///
/// **核心要点**：
/// - 必须使用 GlobalKey<AnimatedListState>
/// - 数据变化后调用 insertItem/removeItem
/// - itemBuilder 中根据 index 构建对应数据
class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  // 【必填】AnimatedList 的状态键，用于控制动画
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  
  // 数据源
  final List<String> _items = List.generate(5, (index) => '项目 ${index + 1}');
  
  // 计数器，用于生成新项目名称
  int _counter = 5;

  @override
  void dispose() {
    // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串
      sourceCode: '''import 'package:flutter/material.dart';

/// AnimatedList 动画列表组件演示
class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  // 【必填】AnimatedList 的状态键
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  
  // 数据源
  final List<String> _items = List.generate(5, (index) => '项目 \${index + 1}');
  int _counter = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedList 演示')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  // 添加项目
  void _addItem() {
    _counter++;
    _items.insert(0, '新项目 \$_counter');
    _listKey.currentState?.insertItem(0);
  }

  // 移除项目
  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(title: Text(item)),
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
                    _buildSectionTitle('📋 AnimatedList 属性说明'),
                    _buildPropertyTable(),

                    const SizedBox(height: 16),

                    _buildSectionTitle('🎯 核心方法说明'),
                    _buildMethodTable(),
                  ],
                ),
              ),
            ),

            // ========== 列表演示区域 ==========
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Column(
                  children: [
                    // 操作按钮栏
                    _buildControlBar(),

                    // AnimatedList 列表
                    Expanded(
                      child: AnimatedList(
                        key: _listKey,
                        initialItemCount: _items.length,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemBuilder: (context, index, animation) {
                          return _buildAnimatedItem(
                            _items[index],
                            index,
                            animation,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addItem,
          icon: const Icon(Icons.add),
          label: const Text('添加项目'),
          backgroundColor: Colors.blue,
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
  Widget _buildPropertyTable() {
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
            _buildTableCell('key'),
            _buildTableCell('GlobalKey'),
            _buildTableCell('控制动画状态（必填）'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('itemBuilder'),
            _buildTableCell('Widget Function'),
            _buildTableCell('构建列表项的回调函数'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('initialItemCount'),
            _buildTableCell('int'),
            _buildTableCell('初始 item 数量'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('padding'),
            _buildTableCell('EdgeInsetsGeometry?'),
            _buildTableCell('列表内边距'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('addAutomaticKeepAlives'),
            _buildTableCell('bool'),
            _buildTableCell('是否自动保持子组件状态'),
          ],
        ),
      ],
    );
  }

  // 构建核心方法表格
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
            _buildTableCell('insertItem(index)'),
            _buildTableCell('在指定位置插入新项，触发动画'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('removeItem(index, builder)'),
            _buildTableCell('移除指定项，需要 builder 构建移除动画'),
          ],
        ),
        // 移除 moveItem 说明，避免误导
        TableRow(
          children: [
            _buildTableCell('moveItem (不支持)'),
            _buildTableCell('标准库不支持，需组合使用 remove+insert'),
          ],
        ),
      ],
    );
  }

  // 构建控制按钮栏
  Widget _buildControlBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _addItem,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('添加'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _items.isNotEmpty ? () => _removeItem(0) : null,
              icon: const Icon(Icons.remove, size: 18),
              label: const Text('移除首个'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              // 修复：移除 _shuffle 按钮或确保 _shuffle 方法内部无错误
              onPressed: _items.length > 1 ? _shuffle : null,
              icon: const Icon(Icons.shuffle, size: 18),
              label: const Text('打乱'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建动画列表项
  Widget _buildAnimatedItem(String item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text('${index + 1}'),
              ),
              title: Text(item),
              subtitle: Text('索引：$index'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 添加项目
  void _addItem() {
    _counter++;
    final newItem = '项目 $_counter';
    
    // 1. 先更新数据源
    _items.insert(0, newItem);
    
    // 2. 通知 AnimatedList 插入动画
    _listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 300));
    
    // 显示提示
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('已添加：$newItem'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  // 移除项目
  void _removeItem(int index) {
    if (index < 0 || index >= _items.length) return;
    _counter--;
    // 1. 先获取要移除的数据
    final removedItem = _items[index];
    
    // 2. 从数据源移除
    _items.removeAt(index);
    
    // 3. 通知 AnimatedList 移除动画
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildAnimatedItem(removedItem, index, animation),
      duration: const Duration(milliseconds: 300),
    );
    
    // 显示提示
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('已删除：$removedItem'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  // 打乱列表 (修复版)
  void _shuffle() {
    // 1. 保存旧数据用于构建移除动画
    final oldItems = List<String>.from(_items);
    
    // 2. 倒序移除所有项 (避免索引错位)
    for (int i = _items.length - 1; i >= 0; i--) {
      final item = _items[i];
      _items.removeAt(i);
      _listKey.currentState?.removeItem(
        i,
        (context, animation) => _buildAnimatedItem(item, i, animation),
        duration: const Duration(milliseconds: 300),
      );
    }
    
    // 3. 打乱数据源
    _items.shuffle();
    
    // 4. 正序插入所有项
    for (int i = 0; i < _items.length; i++) {
      _listKey.currentState?.insertItem(i, duration: const Duration(milliseconds: 300));
    }
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