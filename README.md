# Flutter基础组件示例项目

一个包含Flutter常用组件示例的学习项目，提供详细的组件使用说明和实战案例。

## 项目介绍

这是一个为Flutter初学者和开发者准备的基础组件学习项目。项目按照组件类型组织，每个文件都包含了详细的中文注释和多个使用场景示例，帮助开发者快速掌握Flutter组件的使用方法。

## 功能特点

- 📚 **完整的组件示例**：涵盖50+常用Flutter组件
- 📝 **详细中文注释**：每个组件都有详细的使用说明和参数解释
- 🔍 **多场景演示**：每个组件提供多种使用场景和实战案例
- 🎯 **循序渐进**：按照学习难度从基础到进阶逐步展开
- 📱 **跨平台支持**：支持Android、iOS、Web、Windows、macOS、Linux

## 支持的组件

### 基础组件
- MaterialApp - Flutter应用入口
- Scaffold - 页面框架
- StatelessWidget - 无状态组件
- StatefulWidget - 有状态组件
- Container - 容器组件
- Center - 居中布局
- Padding - 内边距
- Text - 文本组件
- TextField - 输入框

### 布局组件
- Column - 垂直布局
- Row - 水平布局
- Flex - 弹性布局
- Wrap - 流式布局
- Stack & Positioned - 层叠布局
- ListView - 列表组件
- GridView - 网格布局
- CustomScrollView - 自定义滚动视图
- PageView - 页面滑动
- Table - 表格布局

### 交互组件
- GestureDetector - 手势检测
- TextButton - 文本按钮
- FloatingActionButton - 悬浮按钮
- Expanded - 弹性扩展

### 高级组件
- SafeArea - 安全区域
- AnimatedContainer - 动画容器
- Opacity - 透明度控制
- FutureBuilder - 异步数据构建
- FadeTransition - 淡入淡出动画
- SliverAppBar - 可滚动的应用栏
- SliverList - Sliver列表
- SliverGrid - Sliver网格
- FadeInImage - 图片淡入效果
- StreamBuilder - 流数据构建
- ClipRRect - 圆角裁剪
- Hero - 页面转场动画
- CustomPainter - 自定义绘制
- Tooltip - 提示工具
- FittedBox - 适应容器
- LayoutBuilder - 布局构建器
- AbsorbPointer - 触摸拦截
- Transform - 变换组件
- BackdropFilter - 背景模糊
- Align - 对齐组件

## 快速开始

### 环境要求

- Flutter SDK 3.0+
- Dart SDK 3.0+
- Android Studio / VS Code

### 安装步骤

1. **克隆项目**
```bash
git clone https://github.com/yourusername/flutter_base_component.git
cd flutter_base_component
```

2. **安装依赖**
```bash
flutter pub get
```

3. **运行项目**
```bash
flutter run
```

### 项目结构

```
flutter_base_component/
├── lib/                  # 源代码目录
│   ├── main.dart         # 项目入口文件
│   ├── 1.Flutter基础组件MaterialApp.dart     # 组件示例文件
│   ├── 2.Scaffold.dart
│   └── ...               # 其他组件示例
├── test/                 # 测试文件
├── android/              # Android平台代码
├── ios/                  # iOS平台代码
├── web/                  # Web平台代码
├── windows/              # Windows平台代码
├── macos/                # macOS平台代码
├── linux/                # Linux平台代码
├── pubspec.yaml          # 项目配置和依赖
└── README.md            # 项目说明文档
```

## 使用方法

### 运行指定组件示例

打开 `lib/main.dart` 文件，修改 `runApp` 的参数来运行不同的组件示例：

```dart
void main() {
  // 修改为你想要运行的组件示例
  runApp(const MaterialApp(home: StackPositionedDemo()));
}
```

可用的组件示例包括：
- `MaterialAppDemo()`
- `ScaffoldDemo()`
- `StatelessWidgetDemo()`
- `StatefulWidgetDemo()`
- `ContainerDemo()`
- `CenterDemo()`
- `PaddingDemo()`
- `TextDemo()`
- `TextFieldDemo()`
- `ColumnDemo()`
- `RowDemo()`
- `FlexHorizontalDemo()`
- `FlexVerticalDemo()`
- `FlexExampleDemo()`
- `WrapDemo()`
- `StackPositionedDemo()`
- `ListViewDemo()`
- `GridViewDemo()`
- `CustomScrollViewDemo()`
- `StatelessWidgetPassValueDemo()`
- `StatefulWidgetPassValueDemo()`
- `NetworkRequestParentToChildDemo()`
- `BasicRouteDemo()`
- `NamedRouteDemo()`
- `NamedRouteWithParamsDemo()`
- `BasicRouteWithParamsDemo()`
- `DynamicRouteDemo()`
- `Route404Demo()`
- `SafeAreaDemo()`
- `ExpandedDemo()`
- `AnimatedContainerDemo()`
- `OpacityDemo()`
- `FutureBuilderDemo()`
- `FadeTransitionDemo()`
- `FloatingActionButtonDemo()`
- `PageViewDemo()`
- `TableDemo()`
- `SliverAppBarDemo()`
- `SliverListDemo()`
- `SliverGridDemo()`
- `FadeInImageDemo()`
- `StreamBuilderDemo()`
- `ClipRRectDemo()`
- `HeroDemo()`
- `CustomPainterDemo()`
- `TooltipDemo()`
- `FittedBoxDemo()`
- `LayoutBuilderDemo()`
- `AbsorbPointerDemo()`
- `TransformDemo()`
- `BackdropFilterDemo()`
- `AlignDemo()`

### 学习建议

1. **从基础开始**：按照文件编号顺序学习，从基础组件到高级组件
2. **阅读注释**：每个文件都有详细的中文注释，解释组件的用途和参数
3. **运行示例**：修改 `main.dart` 中的入口组件，运行查看效果
4. **修改代码**：尝试修改组件参数，观察变化
5. **实战应用**：结合实际项目需求，灵活运用所学组件

## 开发指南

### 添加新组件示例

1. 在 `lib/` 目录下创建新的Dart文件，命名格式为 `序号.组件名.dart`
2. 编写组件示例代码，包含详细注释
3. 在文件中定义组件类，例如：`class YourComponentDemo extends StatelessWidget`
4. 在 `main.dart` 中导入并运行该组件

### 代码规范

- 使用中文注释说明组件用途和参数
- 示例代码保持简洁清晰
- 提供多种使用场景
- 遵循Flutter官方代码规范

## 贡献指南

欢迎贡献代码和提出建议！

1. Fork项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建Pull Request

## 许可证

本项目采用 MIT 许可证。详情请参阅 [LICENSE](LICENSE) 文件。

## 联系方式

- 作者：Cui Shiqiang
- GitHub：[yourusername](https://github.com/yourusername)
- 邮箱：your@email.com

## 更新日志

### v1.0.0 (2026-03-30)
- 初始版本发布
- 包含57个Flutter组件示例
- 提供完整的中文注释和使用说明

---

**提示**：这是一个学习项目，建议结合Flutter官方文档一起学习，效果更佳！