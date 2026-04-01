import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

// ============================================================================
// AnimatedIcon 动画图标组件演示
// ============================================================================

/// [AnimatedIconDemo] 是 AnimatedIcon 组件的完整演示页面
/// 
/// **用途**：
/// 1. 展示 Flutter 内置的预定义动画图标
/// 2. 演示如何通过 [AnimationController] 控制动画播放
/// 3. 提供多种动画图标的使用示例
/// 
/// **特点**：
/// - 包含 8 种内置动画图标（搜索、菜单、箭头、列表等）
/// - 支持手动控制动画播放/暂停
/// - 提供属性说明表格和源代码查看功能
/// - 统一的卡片式布局，便于学习和参考
class AnimatedIconDemo extends StatefulWidget {
  const AnimatedIconDemo({super.key});

  @override
  State<AnimatedIconDemo> createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
  // ==========================================================================
  // 成员变量
  // ==========================================================================
  
  /// [AnimationController] 动画控制器
  /// 用途：控制所有 AnimatedIcon 的动画进度
  /// 生命周期：在 initState 创建，dispose 销毁
  late AnimationController _controller;

  /// [_isPlaying] 动画播放状态标志
  /// true: 动画正在播放
  /// false: 动画已暂停
  bool _isPlaying = false;

  // ==========================================================================
  // 生命周期方法
  // ==========================================================================

  @override
  void initState() {
    super.initState();
    // 创建动画控制器，设置 vsync 和持续时间
    _controller = AnimationController(
      vsync: this,  // 绑定到当前 State，确保动画与屏幕刷新同步
      duration: const Duration(seconds: 1),  // 动画完整播放耗时 1 秒
    );
  }

  @override
  void dispose() {
    // 重要：销毁动画控制器，释放资源
    _controller.dispose();
    super.dispose();
  }

  // ==========================================================================
  // 业务方法
  // ==========================================================================

  /// [_toggleAnimation] 切换动画播放状态
  /// 
  /// 功能：
  /// - 如果当前未播放，则正向播放动画
  /// - 如果当前正在播放，则反向播放动画
  void _toggleAnimation() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.forward();  // 正向播放
      } else {
        _controller.reverse();  // 反向播放
      }
    });
  }

  // ==========================================================================
  // UI 构建方法
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      // 源代码字符串，用于查看功能
      sourceCode: _getSourceCode(),
      // 实际演示界面
      demoBuilder: () => Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedIcon 动画图标演示'),
          backgroundColor: Colors.blue,
          actions: [
            // 查看源代码按钮
            IconButton(
              icon: const Icon(Icons.code),
              tooltip: '查看源代码',
              onPressed: () => _showSourceCode(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 属性说明表格
              _buildPropertyTable(),
              const SizedBox(height: 24),
              // 动画图标示例列表
              _buildIconExamples(),
            ],
          ),
        ),
      ),
    );
  }

  /// [_buildPropertyTable] 构建属性说明表格
  /// 
  /// 使用 [Table] 组件展示 AnimatedIcon 的核心属性和方法说明
  Widget _buildPropertyTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '📋 AnimatedIcon 属性说明',
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
              _buildTableRow('属性/方法', '类型', '说明'),
              _buildTableRow('icon', 'AnimatedIconData', '预定义的动画图标数据'),
              _buildTableRow('progress', 'Animation<double>', '控制动画进度的动画对象'),
              _buildTableRow('size', 'double', '图标尺寸大小'),
              _buildTableRow('color', 'Color', '图标颜色'),
              _buildTableRow('semanticsLabel', 'String', '无障碍语义标签'),
              _buildTableRow('AnimationController', '类', '控制动画播放的控制器'),
              _buildTableRow('forward()', '方法', '正向播放动画'),
              _buildTableRow('reverse()', '方法', '反向播放动画'),
              _buildTableRow('dispose()', '方法', '释放动画控制器资源'),
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

  /// [_buildIconExamples] 构建所有动画图标示例
  Widget _buildIconExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('🎨 动画图标示例'),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.search_ellipsis,
          name: '搜索图标',
          description: '搜索框展开/收起动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.menu_arrow,
          name: '菜单图标',
          description: '菜单展开/收起动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.close_menu,
          name: '关闭图标',
          description: '关闭按钮动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.list_view,
          name: '列表图标',
          description: '列表视图切换动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.event_add,
          name: '事件图标',
          description: '添加事件动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.play_pause,
          name: '播放暂停图标',
          description: '播放/暂停切换动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.home_menu,
          name: '主页菜单图标',
          description: '主页菜单切换动画',
        ),
        const SizedBox(height: 16),
        _buildAnimatedIconCard(
          icon: AnimatedIcons.arrow_menu,
          name: '箭头菜单图标',
          description: '箭头方向切换动画',
        ),
      ],
    );
  }

  /// [_buildSectionTitle] 构建章节标题
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

  /// [_buildAnimatedIconCard] 构建动画图标卡片
  /// 
  /// 参数：
  /// - [icon]: 动画图标数据
  /// - [name]: 图标名称
  /// - [description]: 图标描述
  Widget _buildAnimatedIconCard({
    required AnimatedIconData icon,
    required String name,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 动画图标展示区域
          GestureDetector(
            onTap: _toggleAnimation,
            child: AnimatedIcon(
              icon: icon,
              progress: _controller,
              size: 64,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          // 图标名称
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // 图标描述
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          // 控制按钮
          ElevatedButton.icon(
            onPressed: _toggleAnimation,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(_isPlaying ? '暂停动画' : '播放动画'),
          ),
        ],
      ),
    );
  }

  /// [_showSourceCode] 显示源代码对话框
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
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
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

  /// [_getSourceCode] 获取源代码字符串
  String _getSourceCode() {
    return '''
// AnimatedIcon 核心使用示例
class AnimatedIconDemo extends StatefulWidget {
  @override
  State createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.search_ellipsis,
      progress: _controller,
      size: 64,
      color: Colors.blue,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
''';
  }
}