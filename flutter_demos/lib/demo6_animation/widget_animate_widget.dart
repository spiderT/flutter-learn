import 'package:flutter/material.dart';

class WidgetAnimateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetAnimateWidgetState();
}

class _WidgetAnimateWidgetState extends State<WidgetAnimateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    // 创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    // 创建从50到200线性变化的Animation对象
    animation = Tween(begin: 50.0, end: 200.0).animate(curve);

// 启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: AnimatedLogo(
      animation: animation,
    )));
  }

  @override
  void dispose() {
    // 释放资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
