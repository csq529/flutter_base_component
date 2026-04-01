import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'source_code_viewer.dart';

/*
  FadeInImage 是一个 Flutter 组件，用于在加载网络图片时显示一个占位图，并在图片加载完成后以淡入动画的方式显示网络图片。FadeInImage 的主要属性包括：
- placeholder：占位图，可以是一个本地图片资源或一个内存中的图片数据。当网络图片正在加载时，FadeInImage 会显示这个占位图。
- image：网络图片的 URL。当网络图片加载完成后，FadeInImage 会以淡入动画的方式显示这个图片。
- fadeInDuration：淡入动画的持续时间，默认为 700 毫秒。你可以通过这个属性来调整动画的速度。
- fadeInCurve：淡入动画的曲线，默认为 Curves.easeIn。你可以通过这个属性来调整动画的 easing

*/

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
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/*
  FadeInImage 是一个 Flutter 组件，用于在加载网络图片时显示一个占位图，并在图片加载完成后以淡入动画的方式显示网络图片。FadeInImage 的主要属性包括：
- placeholder：占位图，可以是一个本地图片资源或一个内存中的图片数据。当网络图片正在加载时，FadeInImage 会显示这个占位图。
- image：网络图片的 URL。当网络图片加载完成后，FadeInImage 会以淡入动画的方式显示这个图片。
- fadeInDuration：淡入动画的持续时间，默认为 700 毫秒。你可以通过这个属性来调整动画的速度。
- fadeInCurve：淡入动画的曲线，默认为 Curves.easeIn。你可以通过这个属性来调整动画的 easing

*/

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

void main() {
  runApp(MaterialApp(home: MyFadeInImage()));
}''',
      demoBuilder: () => Scaffold(
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyFadeInImage()));
}
