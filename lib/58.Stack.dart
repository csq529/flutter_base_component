import 'package:flutter/material.dart';

/// ============================================================================
/// Stack 组件说明
/// ============================================================================
/// 
/// 【用途】: 将多个子组件**层叠**在一起，形成堆叠布局
/// 
/// 【特点】:
/// 1. 子组件按照添加顺序从后往前绘制（后面的覆盖前面的）
/// 2. 默认大小由最大的非 Positioned 子组件决定
/// 3. 可以配合 Positioned 精确定位子组件
/// 4. 支持 alignment 属性控制非 Positioned 子组件的对齐
/// 
/// 【常见场景】:
/// - 图片上叠加文字或图标
/// - 角标/徽章效果
/// - 自定义按钮（图标 + 文字层叠）
/// - 复杂的重叠布局
/// 
/// ============================================================================

/// ============================================================================
/// Positioned 组件说明
/// ============================================================================
/// 
/// 【用途】: 在 Stack 中**精确定位**子组件的位置
/// 
/// 【特点】:
/// 1. 必须作为 Stack 的直接子组件使用
/// 2. 通过 top/left/right/bottom 控制位置
/// 3. 通过 width/height 控制大小
/// 4. 不能同时指定 left 和 right（会冲突），不能同时指定 top 和 bottom
/// 
/// 【定位规则】:
/// - 指定 left + top: 从左上角定位
/// - 指定 right + bottom: 从右下角定位
/// - 指定 left + right: 水平拉伸，宽度固定
/// - 指定 top + bottom: 垂直拉伸，高度固定
/// 
/// 【常见场景】:
/// - 右上角关闭按钮
/// - 左下角价格标签
/// - 居中的加载指示器
/// - 任意位置的浮动元素
/// 
/// ============================================================================

class StackPositionedDemo extends StatelessWidget {
  const StackPositionedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================================
            // 示例 1: 基础层叠效果
            // ======================================================================
            _buildSectionTitle('示例 1: 基础层叠效果'),
            _buildBasicStack(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 2: Positioned 精确定位
            // ======================================================================
            _buildSectionTitle('示例 2: Positioned 精确定位'),
            _buildPositionedDemo(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 3: 图片叠加文字（常见场景）
            // ======================================================================
            _buildSectionTitle('示例 3: 图片叠加文字'),
            _buildImageOverlay(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 4: 角标/徽章效果
            // ======================================================================
            _buildSectionTitle('示例 4: 角标/徽章效果'),
            _buildBadgeDemo(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 5: 拉伸填充效果
            // ======================================================================
            _buildSectionTitle('示例 5: 拉伸填充效果'),
            _buildStretchDemo(),
            
            const SizedBox(height: 24),
            
            // ======================================================================
            // 示例 6: 实际应用场景 - 商品卡片
            // ======================================================================
            _buildSectionTitle('示例 6: 实际应用场景 - 商品卡片'),
            _buildProductCard(),
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
  // 示例 1: 基础层叠效果
  // ============================================================================
  Widget _buildBasicStack() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        // alignment: 控制非 Positioned 子组件的对齐方式
        alignment: Alignment.center,
        children: [
          // 底层：蓝色矩形（最先绘制，在最下面）
          Container(
            width: 150,
            height: 150,
            color: Colors.blue.withOpacity(0.5),
            child: const Center(
              child: Text('底层', style: TextStyle(color: Colors.white)),
            ),
          ),
          
          // 中层：绿色矩形（覆盖蓝色）
          Container(
            width: 120,
            height: 120,
            color: Colors.green.withOpacity(0.6),
            child: const Center(
              child: Text('中层', style: TextStyle(color: Colors.white)),
            ),
          ),
          
          // 顶层：红色矩形（最后绘制，在最上面）
          Container(
            width: 90,
            height: 90,
            color: Colors.red.withOpacity(0.7),
            child: const Center(
              child: Text('顶层', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 2: Positioned 精确定位
  // ============================================================================
  Widget _buildPositionedDemo() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 背景容器
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: const Center(
              child: Text('背景容器', style: TextStyle(color: Colors.grey)),
            ),
          ),
          
          // 左上角定位
          Positioned(
            left: 10,
            top: 10,
            child: _buildPositionedBox('左上', Colors.red, 'left: 10\ntop: 10'),
          ),
          
          // 右上角定位
          Positioned(
            right: 10,
            top: 10,
            child: _buildPositionedBox('右上', Colors.orange, 'right: 10\ntop: 10'),
          ),
          
          // 左下角定位
          Positioned(
            left: 10,
            bottom: 10,
            child: _buildPositionedBox('左下', Colors.green, 'left: 10\nbottom: 10'),
          ),
          
          // 右下角定位
          Positioned(
            right: 10,
            bottom: 10,
            child: _buildPositionedBox('右下', Colors.blue, 'right: 10\nbottom: 10'),
          ),
          
          // 居中定位（使用 left+right+top+bottom 实现）
          Positioned(
            left: 80,
            right: 80,
            top: 80,
            bottom: 80,
            child: _buildPositionedBox('居中拉伸', Colors.purple, '四边定位'),
          ),
        ],
      ),
    );
  }

  Widget _buildPositionedBox(String label, Color color, String info) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(info, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 3: 图片叠加文字（常见场景）
  // ============================================================================
  Widget _buildImageOverlay() {
    return Stack(
      children: [
        // 底层：图片
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://picsum.photos/400/200',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // 网络图片加载失败时显示占位图
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              // 加载中的占位显示
              if (loadingProgress == null) return child;
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: CircularProgressIndicator(
                    // 修复：使用 expectedTotalBytes 计算进度
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
        
        // 顶层：渐变遮罩（让文字更清晰）
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),
        
        // 顶层：文字内容
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '图片标题',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '这是叠加在图片上的描述文字',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        
        // 右上角：收藏按钮
        Positioned(
          right: 12,
          top: 12,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // 示例 4: 角标/徽章效果
  // ============================================================================
  Widget _buildBadgeDemo() {
    return Row(
      children: [
        // 场景 1: 消息数量角标
        Expanded(
          child: _buildBadgeCard(
            title: '消息角标',
            child: Stack(
              children: [
                // 图标按钮
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.mail, color: Colors.white, size: 30),
                ),
                
                // 红色角标
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '9+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // 场景 2: 新品标签
        Expanded(
          child: _buildBadgeCard(
            title: '新品标签',
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.shopping_bag, size: 40, color: Colors.grey),
                    ),
                  ),
                ),
                
                // 左上角新品标签
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // 场景 3: 促销标签
        Expanded(
          child: _buildBadgeCard(
            title: '促销标签',
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.local_offer, size: 40, color: Colors.grey),
                    ),
                  ),
                ),
                
                // 右下角促销标签
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '5折',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget _buildBadgeCard({required String title, required Widget child}) {
    return Column(
      children: [
        child,
        const SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  // ============================================================================
  // 示例 5: 拉伸填充效果
  // ============================================================================
  Widget _buildStretchDemo() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 16, 16),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          // 背景
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade100, Colors.blue.shade300],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          
          // 水平拉伸（固定左右边距）
          Positioned(
            left: 20,
            right: 20,
            top: 30,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('水平拉伸：left + right 固定，宽度自适应'),
            ),
          ),
          
          // 垂直拉伸（固定上下边距）
          Positioned(
            left: 20,
            top: 80,
            bottom: 30,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('垂直拉伸\ntop + bottom\n固定', textAlign: TextAlign.center),
              ),
            ),
          ),
          
          // 四边拉伸（填充剩余空间）
          Positioned(
            left: 140,
            right: 20,
            top: 80,
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('四边拉伸\n填充剩余空间', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // 示例 6: 实际应用场景 - 商品卡片
  // ============================================================================
  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 商品图片
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              'https://picsum.photos/400/250',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.shopping_bag, size: 60, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          
          // 收藏按钮（右上角）
          Positioned(
            right: 12,
            top: 12,
            child: GestureDetector(
              onTap: () {
                // 收藏逻辑
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.favorite_border, color: Colors.red, size: 20),
              ),
            ),
          ),
          
          // 折扣标签（左上角）
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '限时折扣',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          // 商品信息（底部）
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '精选商品标题精选商品标题精选商品标题精选商品标题',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        '¥99.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '¥199.00',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('北京', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text('购买'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}