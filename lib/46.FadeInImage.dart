import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MaterialApp(home: MyFadeInImage()));
}

class MyFadeInImage extends StatefulWidget {
  const MyFadeInImage({super.key});

  @override
  State<MyFadeInImage> createState() => _MyFadeInImageState();
}

class _MyFadeInImageState extends State<MyFadeInImage> {
  Widget _buildFadeInImageAsset() {
    return FadeInImage.assetNetwork(
      fadeInDuration: Duration(seconds: 2), // 动画时长
      fadeInCurve: Curves.easeInOut, // 动画方式
      placeholder: 'lib/images/01.png', // 展位图片
      image:
          'https://p3-juejin-sign.byteimg.com/tos-cn-i-k3u1fbpfcp/d20113748df04c1696177b72e3d1a327~tplv-k3u1fbpfcp-jj-mark-v1:0:0:0:0:5o6Y6YeR5oqA5pyv56S-5Yy6IEAg5L6D5bCRMjA3Nw==:q75.awebp?rk3s=f64ab15b&x-expires=1775033934&x-signature=1kWauuiJtlNw68lEI5iU0unsbBc%3D', // 图片地址
    );
  }

   Widget _buildFadeInImageMemory() {
    return FadeInImage.memoryNetwork(
      fadeInDuration: const Duration(seconds: 2),
      fadeInCurve: Curves.easeInOut,
      placeholder: kTransparentImage, // 展位设置为透明图片
      image: 'https://p3-juejin-sign.byteimg.com/tos-cn-i-k3u1fbpfcp/d20113748df04c1696177b72e3d1a327~tplv-k3u1fbpfcp-jj-mark-v1:0:0:0:0:5o6Y6YeR5oqA5pyv56S-5Yy6IEAg5L6D5bCRMjA3Nw==:q75.awebp?rk3s=f64ab15b&x-expires=1775033934&x-signature=1kWauuiJtlNw68lEI5iU0unsbBc%3D',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // _buildFadeInImageAsset(),
              _buildFadeInImageMemory()
            ],
          ),
        ),
      ),
    );
  }
}
