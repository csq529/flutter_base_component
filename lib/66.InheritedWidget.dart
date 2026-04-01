import 'package:flutter/material.dart';

// ==================== 1. 自定义 InheritedWidget ====================

/// [AppData] 是一个继承自 [InheritedWidget] 的类
/// 用途：在 Widget 树中向下传递共享数据，避免层层传递参数
/// 特点：子组件可以高效地获取和监听数据变化
class AppData extends InheritedWidget {
  /// 共享的用户名数据
  final String userName;

  /// 共享的主题颜色
  final Color themeColor;

  /// 计数值，用于演示数据更新
  final int count;

  /// 构造函数
  const AppData({
    super.key,
    required this.userName,
    required this.themeColor,
    required this.count,
    required super.child,
  });

  /// [of] 方法：供子组件获取 [AppData] 实例
  /// 返回最近的 [AppData] 祖先节点，并建立依赖关系
  /// 当 [AppData] 数据变化时，依赖它的组件会自动重建
  static AppData of(BuildContext context) {
    final appData = context.dependOnInheritedWidgetOfExactType<AppData>();
    assert(appData != null, '没有找到 AppData 祖先节点');
    return appData!;
  }

  /// [updateShouldNotify] 方法：判断是否需要通知依赖组件重建
  /// 返回 true 表示数据已变化，依赖组件需要更新
  /// 返回 false 表示数据未变化，无需重建（性能优化）
  @override
  bool updateShouldNotify(AppData oldWidget) {
    return oldWidget.userName != userName ||
        oldWidget.themeColor != themeColor ||
        oldWidget.count != count;
  }
}

// ==================== 2. 主页面示例 ====================

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({super.key});

  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  String _userName = '张三';
  Color _themeColor = Colors.blue;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return AppData(
      userName: _userName,
      themeColor: _themeColor,
      count: _count,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 属性说明表格
                _buildPropertyTable(),
                const SizedBox(height: 24),
                // ✅ 添加 UserInfoWidget 显示用户信息
                const UserInfoWidget(),
                const SizedBox(height: 24),
                // 数据显示区域
                _buildDisplayArea(),
                const SizedBox(height: 24),
                // 控制按钮区域
                _buildControlButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 构建属性说明表格
  Widget _buildPropertyTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 属性说明',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
            },
            children: [
              _buildTableRow('属性名', '类型', '说明'),
              _buildTableRow('userName', 'String', '共享的用户名数据'),
              _buildTableRow('themeColor', 'Color', '共享的主题颜色'),
              _buildTableRow('count', 'int', '计数值，用于演示更新'),
              _buildTableRow('of()', 'static', '获取实例并建立依赖'),
              _buildTableRow('updateShouldNotify()', 'bool', '判断是否需要通知重建'),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建表格行
  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(
      children: [
        _buildTableCell(col1, isHeader: true),
        _buildTableCell(col2, isHeader: true),
        _buildTableCell(col3, isHeader: true),
      ],
    );
  }

  /// 构建表格单元格
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

  /// 构建数据显示区域
  Widget _buildDisplayArea() {
    return Card(
      color: _themeColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📊 当前数据 (通过 InheritedWidget 共享)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildDataItem('用户名', _userName),
            _buildDataItem('主题颜色', _themeColor.value.toRadixString(16)),
            _buildDataItem('计数值', _count.toString()),
          ],
        ),
      ),
    );
  }

  /// 构建数据项
  Widget _buildDataItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: _themeColor,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建控制按钮区域
  Widget _buildControlButtons() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎮 操作控制',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _userName = '李四'),
                  child: const Text('修改用户名'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _themeColor = Colors.green),
                  child: const Text('修改主题色'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _count++),
                  child: const Text('增加计数'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _userName = '张三';
                    _themeColor = Colors.blue;
                    _count = 0;
                  }),
                  child: const Text('重置'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== 3. 子组件示例（消费数据） ====================

/// [UserInfoWidget] 演示如何从 InheritedWidget 获取数据
/// 特点：当 [AppData] 数据变化时，此组件会自动重建
class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取 AppData 实例，并建立依赖关系
    final appData = AppData.of(context);

    return Card(
      child: ListTile(
        leading: Icon(Icons.person, color: appData.themeColor),
        title: Text('用户111：${appData.userName}'),
        subtitle: Text('计数：${appData.count}'),
      ),
    );
  }
}
