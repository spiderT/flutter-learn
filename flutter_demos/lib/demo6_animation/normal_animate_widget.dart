import 'package:flutter/material.dart';

class NormalAnimateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NormalAnimateState();
}

class _NormalAnimateState extends State<NormalAnimateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  void initState() {
    super.initState();
    // 创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    // 创建从50到200线性变化的Animation对象
    // 普通动画需要手动监听动画状态，刷新UI
    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
      ..addListener(() => setState(() {}));

    // 启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Container(
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    ))));
  }

  @override
  void dispose() {
    // 释放资源
    controller.dispose();
    super.dispose();
  }
}
