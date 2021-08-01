import 'package:flutter/material.dart';
import './router/index.dart';
import './router/mobile.dart';
import './utils/app_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPlatform.isMobile()
        ? MaterialApp(
            title: 'spiderChat',
            routes: mobileroutes,
          )
        : MaterialApp(
            title: 'spiderChat',
            routes: routes,
          );
  }
}
