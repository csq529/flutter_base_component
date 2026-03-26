import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HeroStartPage()));
}
/*
 Hero 组件
 Hero 组件用于在导航中创建动画效果。
 Hero 组件需要两个页面，一个起始页面，一个目标页面。
 在导航中，起始页面的 Hero 组件会创建一个动画，目标页面的 Hero 组件会执行这个动画。
 Hero 创建的动画效果是图片的缩放和位移。
*/
// 起始页面
class HeroStartPage extends StatelessWidget {
  const HeroStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero 起始页')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HeroEndPage()),
            );
          },
          child: Hero(
            tag: 'hero-image-tag', // 唯一标识，两端页面必须一致
            child: Image.network(
              'https://picsum.photos/200/300',
              width: 200,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// 目标页面
class HeroEndPage extends StatelessWidget {
  const HeroEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero 目标页')),
      body: Center(
        child: Hero(
          tag: 'hero-image-tag', // 与起始页相同的 tag
          child: Image.network(
            'https://picsum.photos/200/300',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}