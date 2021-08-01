import 'package:flutter/material.dart';

// 引入各路由组件
import '../mobilepages/homepage.dart';
import '../mobilepages/chat.dart';
import '../pages/login.dart';

final mobileroutes = <String, WidgetBuilder>{
  '/': (context) => Login(),
  'home': (context) => HomePage(),
  'chat': (context) => Chat(),
};
