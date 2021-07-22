import 'package:flutter/material.dart';

// 引入各路由组件
import '../pages/homepage.dart';
import '../pages/login.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => Login(),
  'home': (context) => HomePage(),
};
