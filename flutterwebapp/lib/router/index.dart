import 'package:flutter/material.dart';
import '../utils/mediaquery_size.dart';

// 引入各路由组件
import '../pages/homepage.dart';
import '../pages/login.dart';
import '../mobilepages/homepage.dart';
import '../mobilepages/chat.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => Login(),
  'home': (context) =>
      MediaQuerySize.isMobileLayout(context) ? MobileHomePage() : HomePage(),
  'chat': (context) => Chat(),
};
