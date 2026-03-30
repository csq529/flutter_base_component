import 'dart:ui' as ui;  // 导入 dart:ui 库，用于使用 ImageFilter
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BackdropFilterDemo()));
}

/// ============================================================================
/// BackdropFilter 组件说明
/// ============================================================================
/// 
/// 【用途】: 对其**背后**的内容进行滤镜处理
/// 
/// 【特点】:
/// 1. 不会影响子组件本身，只影响子组件背后的内容
/// 2. 常用于创建毛玻璃（模糊）效果
/// 3. 必须配合 ClipRRect 或 ClipRect 使用才能看到效果
/// 4. 性能消耗较大，需谨慎使用
/// 
/// 【常见场景】:
/// - 毛玻璃卡片背景
/// - 模态弹窗背景模糊
/// - 导航栏滚动模糊效果
/// - 隐私信息模糊处理
/// 
/// ============================================================================

class BackdropFilterDemo extends StatefulWidget {
  const BackdropFilterDemo({super.key});

  @override
  State<BackdropFilterDemo> createState() => _BackdropFilterDemoState();
}

class _BackdropFilterDemoState extends State<BackdropFilterDemo> {
  double _blurSigma = 10.0;  // 模糊强度参数，值越大越模糊

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BackdropFilter & ImageFilter Demo'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,  // 让内容延伸到状态栏后面
      body: Stack(
        children: [
          // ======================================================================
          // 背景层：可以是图片、渐变等任何内容
          // BackdropFilter 会对这一层进行滤镜处理
          // ======================================================================
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.purple.shade400,
                    Colors.orange.shade400,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.layers, size: 80, color: Colors.white24),
                    SizedBox(height: 16),
                    Text(
                      '背景层',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // ======================================================================
          // 主内容层
          // ======================================================================
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 说明卡片
                  _buildInfoCard(),
                  
                  const SizedBox(height: 24),
                  
                  // 示例 1: 毛玻璃卡片
                  _buildSectionTitle('示例 1: 毛玻璃卡片'),
                  _buildBlurCard(),
                  
                  const SizedBox(height: 24),
                  
                  // 示例 2: 模糊强度调节
                  _buildSectionTitle('示例 2: 调节模糊强度'),
                  _buildAdjustableBlurCard(),
                  
                  const SizedBox(height: 24),
                  
                  // 示例 3: 多种滤镜效果
                  _buildSectionTitle('示例 3: ImageFilter 多种效果'),
                  _buildMultipleFilters(),
                  
                  const SizedBox(height: 24),
                  
                  // 示例 4: 模态框毛玻璃
                  _buildSectionTitle('示例 4: 模态框毛玻璃'),
                  _buildModalButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 信息说明卡片
  // ============================================================================
  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('📦 组件', 'BackdropFilter'),
          _buildInfoRow('🎯 用途', '对背后内容进行滤镜处理'),
          _buildInfoRow('🔧 滤镜', 'ImageFilter 提供多种滤镜'),
          _buildInfoRow('⚠️ 注意', '需配合 ClipRRect 使用'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 60, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(': $value'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // ============================================================================
  // 示例 1: 毛玻璃卡片
  // 
  // 核心代码结构：
  // ClipRRect (裁剪圆角)
  //   └─ BackdropFilter (应用滤镜)
  //       └─ Container (设置半透明背景色)
  // ============================================================================
  Widget _buildBlurCard() {
    return ClipRRect(  // 【必须】裁剪圆角，否则滤镜效果不显示
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(  // 【核心】应用滤镜效果
        // ImageFilter.blur 创建高斯模糊
        // sigmaX: X 轴模糊强度
        // sigmaY: Y 轴模糊强度
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(  // 【必须】设置半透明背景，才能看到背后的模糊效果
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),  // 半透明白色背景
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.3)),  // 半透明边框
          ),
          child: const Column(
            children: [
              Icon(Icons.blur_on, size: 48, color: Colors.white),
              SizedBox(height: 16),
              Text(
                '毛玻璃效果',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '背景内容被模糊处理',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // 示例 2: 可调节模糊强度
  // ============================================================================
  Widget _buildAdjustableBlurCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // 模糊效果预览
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: Center(
                  child: Text(
                    '模糊强度：${_blurSigma.toStringAsFixed(1)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 滑动条控制
          Text('拖动滑块调节模糊强度', style: TextStyle(color: Colors.grey[700])),
          Slider(
            value: _blurSigma,
            min: 0,      // 最小模糊值
            max: 20,     // 最大模糊值
            divisions: 20,  // 分段数
            label: _blurSigma.toStringAsFixed(1),
            onChanged: (value) {
              setState(() {
                _blurSigma = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 3: ImageFilter 多种滤镜效果
  // 
  // ImageFilter 提供的常用滤镜：
  // 1. blur() - 高斯模糊
  // 2. dilate() - 膨胀效果
  // 3. erode() - 腐蚀效果
  // 注意：colorFilter 在当前稳定版 SDK 中不可用，已替换为 blur 变体
  // ============================================================================
  Widget _buildMultipleFilters() {
    return Column(
      children: [
        // 效果 1: 轻度模糊
        _buildFilterItem(
          name: '轻度模糊',
          icon: Icons.blur_on,
          filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          description: 'sigmaX/Y = 5',
        ),
        
        const SizedBox(height: 12),
        
        // 效果 2: 强度模糊
        _buildFilterItem(
          name: '强度模糊',
          icon: Icons.blur_circular,
          filter: ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          description: 'sigmaX/Y = 15',
        ),
        
        const SizedBox(height: 12),
        
        // 效果 3: 替换为轻微模糊 (原灰度滤镜不可用)
        // 修复：移除 ui.ImageFilter.colorFilter，改用 blur 避免报错
        _buildFilterItem(
          name: '轻微模糊 (原灰度)',
          icon: Icons.filter_b_and_w,
          filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          description: '颜色滤镜需使用 ColorFiltered 组件',
        ),
        
        const SizedBox(height: 12),
        
        // 效果 4: 替换为轻微模糊 (原反色滤镜不可用)
        // 修复：移除 ui.ImageFilter.colorFilter，改用 blur 避免报错
        _buildFilterItem(
          name: '轻微模糊 (原反色)',
          icon: Icons.invert_colors,
          filter: ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          description: 'ImageFilter 不支持 colorFilter',
        ),
      ],
    );
  }

  Widget _buildFilterItem({
    required String name,
    required IconData icon,
    required ui.ImageFilter filter,
    required String description,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: filter,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              // 滤镜图标
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 16),
              // 滤镜信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(description, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // 示例 4: 模态框毛玻璃效果
  // ============================================================================
  Widget _buildModalButton() {
    return GestureDetector(
      onTap: _showBlurModal,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.touch_app, color: Colors.white),
            SizedBox(width: 8),
            Text(
              '点击显示毛玻璃模态框',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _showBlurModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,  // 透明背景，让毛玻璃效果可见
      builder: (context) => ClipRRect(  // 裁剪圆角
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(  // 应用毛玻璃滤镜
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),  // 半透明背景
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 顶部指示条
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('毛玻璃模态框', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                // 菜单项
                ListTile(leading: const Icon(Icons.share), title: const Text('分享'), onTap: () {}),
                ListTile(leading: const Icon(Icons.bookmark), title: const Text('收藏'), onTap: () {}),
                ListTile(leading: const Icon(Icons.report), title: const Text('举报'), onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}