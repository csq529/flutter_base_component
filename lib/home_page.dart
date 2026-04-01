import 'package:flutter/material.dart';
import '2.Scaffold.dart' as scaffold;
import '3.无状态组件 StatelessWidget copy.dart' as stateless_widget;
import '4.有状态组件-StatefulWidget.dart' as stateful_widget;
import '5.点击事件-GestureDetector.dart' as gesture_detector;
import '6.点击组件-TextButton.dart' as text_button;
import '7.状态更新-setState.dart' as state_set;
import '8.Container.dart' as container;
import '9.Center.dart' as center;
import '10.Padding.dart' as padding;
import '11.Column.dart' as column;
import '12.Row.dart' as row;
import '13.Flex_Horizontal.dart' as flex_horizontal;
import '14.Flex_Vertical.dart' as flex_vertical;
import '15.Flex实例.dart' as flex_example;
import '16.Wrap.dart' as wrap;
import '17.Stack_Positioned.dart' as stack_positioned;
import '18.Text.dart' as text;
import '19.TextField.dart' as text_field;
import '20.ListView.dart' as list_view;
import '21.GridView.dart' as grid_view;
import '22.CustomScrollView.dart' as custom_scroll_view;
import '23.无状态组件传值.dart' as stateless_pass_value;
import '24.有状态组件传值.dart' as stateful_pass_value;
import '24.传值demo.dart' as pass_value_demo;
import '25.传值demo.dart' as pass_value_demo2;
import '26.网络请求-父传子.dart' as network_request;
import '27.路由-基础路由.dart' as basic_route;
import '28.路由-命名路由.dart' as named_route;
import '29.路由-命名路由传参.dart' as named_route_params;
import '30.路由-基础路由传参.dart' as basic_route_params;
import '31.路由-动态路由.dart' as dynamic_route;
import '32.路由-404路由.dart' as route_404;
import '33.安全区域组件SafeArea.dart' as safe_area;
import '34.Expanded.dart' as expanded;
import '35.Wrap.dart' as wrap2;
import '36.AnimatedContainer.dart' as animated_container;
import '37.Opacity.dart' as opacity;
import '38.FutureBuilder.dart' as future_builder;
import '39.FadeTransition.dart' as fade_transition;
import '40.FloatingActionButton.dart' as floating_action_button;
import '41.PageView.dart' as page_view;
import '42.Table.dart' as table;
import '43.SliverAppBar.dart' as sliver_app_bar;
import '44.SliverList.dart' as sliver_list;
import '45.SliverGrid.dart' as sliver_grid;
import '46.FadeInImage.dart' as fade_in_image;
import '47.StreamBuilder.dart' as stream_builder;
import '48.ClipRReact.dart' as clip_rrect;
import '49.Hero.dart' as hero;
import '50.CustomPainter.dart' as custom_painter;
import '51.Tooltip.dart' as tooltip;
import '52.FittedBox.dart' as fitted_box;
import '53.LayoutBuilder.dart' as layout_builder;
import '54.AbsorbPointer.dart' as absorb_pointer;
import '55.Transfrom.dart' as transform;
import '56.BackdropFilter.dart' as backdrop_filter;
import '57.Align.dart' as align;
import '58.Stack.dart';
import '59.Dismissiable.dart';
import '60.SizeBox.dart';
import '61.ValueListerableBuilder.dart';

class Component {
  final String name;
  final String description;
  final Widget Function() builder;

  Component({
    required this.name,
    required this.description,
    required this.builder,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter组件示例'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: components.length,
        itemBuilder: (context, index) {
          final component = components[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                component.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                component.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(component.name),
                        backgroundColor: Colors.blue,
                      ),
                      body: component.builder(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

List<Component> components = [
  Component(
    name: 'Scaffold',
    description: '页面框架组件',
    builder: () => scaffold.MainPage(),
  ),
  Component(
    name: 'StatelessWidget',
    description: '无状态组件',
    builder: () => stateless_widget.mainPage(),
  ),
  Component(
    name: 'StatefulWidget',
    description: '有状态组件',
    builder: () => stateful_widget.MainPage(),
  ),
  Component(
    name: 'GestureDetector',
    description: '手势检测组件',
    builder: () => gesture_detector.mainPage(),
  ),
  Component(
    name: 'TextButton',
    description: '文本按钮组件',
    builder: () => text_button.mainPage(),
  ),
  Component(
    name: 'setState',
    description: '状态更新方法',
    builder: () => state_set.MainPage(),
  ),
  Component(
    name: 'Container',
    description: '容器组件',
    builder: () => container.MainPage(),
  ),
  Component(
    name: 'Center',
    description: '居中布局组件',
    builder: () => center.MainPage(),
  ),
  Component(
    name: 'Padding',
    description: '内边距组件',
    builder: () => padding.MainPage(),
  ),
  Component(
    name: 'Column',
    description: '垂直布局组件',
    builder: () => column.MainPage(),
  ),
  Component(name: 'Row', description: '水平布局组件', builder: () => row.MainPage()),
  Component(
    name: 'Flex-Horizontal',
    description: '水平弹性布局',
    builder: () => flex_horizontal.MainPage(),
  ),
  Component(
    name: 'Flex-Vertical',
    description: '垂直弹性布局',
    builder: () => flex_vertical.MainPage(),
  ),
  Component(
    name: 'Flex实例',
    description: '弹性布局实例',
    builder: () => flex_example.MainPage(),
  ),
  Component(
    name: 'Wrap',
    description: '流式布局组件',
    builder: () => wrap.MainPage(),
  ),
  Component(
    name: 'Stack & Positioned',
    description: '层叠布局组件',
    builder: () => stack_positioned.MainPage(),
  ),
  Component(name: 'Text', description: '文本组件', builder: () => text.MainPage()),
  Component(
    name: 'TextField',
    description: '输入框组件',
    builder: () => text_field.MainPage(),
  ),
  Component(
    name: 'ListView',
    description: '列表组件',
    builder: () => list_view.MainPage(),
  ),
  Component(
    name: 'GridView',
    description: '网格布局组件',
    builder: () => grid_view.MainPage(),
  ),
  Component(
    name: 'CustomScrollView',
    description: '自定义滚动视图',
    builder: () => custom_scroll_view.MainPage(),
  ),
  Component(
    name: '无状态组件传值',
    description: '组件间数据传递',
    builder: () => stateless_pass_value.MainPage(),
  ),
  Component(
    name: '有状态组件传值',
    description: '有状态组件数据传递',
    builder: () => stateful_pass_value.MainPage(),
  ),
  Component(
    name: '传值demo',
    description: '组件传值示例',
    builder: () => pass_value_demo.MainPage(),
  ),
  Component(
    name: '传值demo2',
    description: '组件传值示例2',
    builder: () => pass_value_demo2.MainPage(),
  ),
  Component(
    name: '网络请求-父传子',
    description: '网络数据传递示例',
    builder: () => network_request.MainPage(),
  ),
  Component(
    name: '路由-基础路由',
    description: '页面跳转基础用法',
    builder: () => basic_route.MainPage(),
  ),
  Component(
    name: '路由-命名路由',
    description: '命名路由跳转',
    builder: () => named_route.MainPage(),
  ),
  Component(
    name: '路由-命名路由传参',
    description: '命名路由参数传递',
    builder: () => named_route_params.MainPage(),
  ),
  Component(
    name: '路由-基础路由传参',
    description: '基础路由参数传递',
    builder: () => basic_route_params.MainPage(),
  ),
  Component(
    name: '路由-动态路由',
    description: '动态路由跳转',
    builder: () => dynamic_route.MainPage(),
  ),
  Component(
    name: '路由-404路由',
    description: '未找到页面处理',
    builder: () => route_404.MainPage(),
  ),
  Component(
    name: 'SafeArea',
    description: '安全区域组件',
    builder: () => safe_area.SafeAreaWidget(),
  ),
  Component(
    name: 'Expanded',
    description: '弹性扩展组件',
    builder: () => expanded.ExpandedWeiget(),
  ),
  Component(
    name: 'Wrap2',
    description: '流式布局组件2',
    builder: () => wrap2.WrapWidget(),
  ),
  Component(
    name: 'AnimatedContainer',
    description: '动画容器组件',
    builder: () => animated_container.AnimatedContainerWidget(),
  ),
  Component(
    name: 'Opacity',
    description: '透明度控制组件',
    builder: () => opacity.OpacityWidget(),
  ),
  Component(
    name: 'FutureBuilder',
    description: '异步数据构建组件',
    builder: () => future_builder.FutureBuilderWidget(),
  ),
  Component(
    name: 'FadeTransition',
    description: '淡入淡出动画',
    builder: () => fade_transition.MyFadeIn(),
  ),
  Component(
    name: 'FloatingActionButton',
    description: '悬浮按钮组件',
    builder: () => floating_action_button.MyFloatingActionButton(),
  ),
  Component(
    name: 'PageView',
    description: '页面滑动组件',
    builder: () => page_view.MyPageView(),
  ),
  Component(
    name: 'Table',
    description: '表格布局组件',
    builder: () => table.MyTable(),
  ),
  Component(
    name: 'SliverAppBar',
    description: '可滚动应用栏',
    builder: () => sliver_app_bar.MySliverAppBar(),
  ),
  Component(
    name: 'SliverList',
    description: 'Sliver列表组件',
    builder: () => sliver_list.MySliverList(),
  ),
  Component(
    name: 'SliverGrid',
    description: 'Sliver网格组件',
    builder: () => sliver_grid.MySliverGrid(),
  ),
  Component(
    name: 'FadeInImage',
    description: '图片淡入效果',
    builder: () => fade_in_image.MyFadeInImage(),
  ),
  Component(
    name: 'StreamBuilder',
    description: '流数据构建组件',
    builder: () => stream_builder.CounterPage(),
  ),
  Component(
    name: 'ClipRRect',
    description: '圆角裁剪组件',
    builder: () => clip_rrect.MyClipRReact(),
  ),
  Component(
    name: 'Hero',
    description: '页面转场动画',
    builder: () => hero.HeroStartPage(),
  ),
  Component(
    name: 'CustomPainter',
    description: '自定义绘制组件',
    builder: () => custom_painter.MyCustomPaint(),
  ),
  Component(
    name: 'Tooltip',
    description: '提示工具组件',
    builder: () => tooltip.MyTooltip(),
  ),
  Component(
    name: 'FittedBox',
    description: '适应容器组件',
    builder: () => fitted_box.FittedBoxDemo(),
  ),
  Component(
    name: 'LayoutBuilder',
    description: '布局构建器',
    builder: () => layout_builder.LayoutBuilderDemo(),
  ),
  Component(
    name: 'AbsorbPointer',
    description: '触摸拦截组件',
    builder: () => absorb_pointer.MyAbsorbPointer(),
  ),
  Component(
    name: 'Transform',
    description: '变换组件',
    builder: () => transform.TransformDemo(),
  ),
  Component(
    name: 'BackdropFilter',
    description: '背景模糊组件',
    builder: () => backdrop_filter.BackdropFilterDemo(),
  ),
  Component(
    name: 'Align',
    description: '对齐组件',
    builder: () => align.AlignDemo(),
  ),
  Component(
    name: 'Stack & Positioned',
    description: '堆叠布局组件',
    builder: () => StackPositionedDemo(),
  ),
  Component(
    name: 'DismissiableDemo',
    description: '滑动删除组件',
    builder: () => DismissibleDemo(),
  ),
  Component(
    name: 'SizeBoxDemo',
    description: '尺寸盒子组件演示',
    builder: () => SizeBoxDemo(),
  ),
  Component(
    name: 'ValueListenableBuilderDemo',
    description: '值监听构建器组件演示',
    builder: () => ValueListenableBuilderDemo(),
  ),
];
