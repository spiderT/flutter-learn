import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。'),
          padding: EdgeInsets.all(18.0), // 内边距
          margin: EdgeInsets.all(44.0), // 外边距
          width: 180.0,
          height: 240,
          decoration: BoxDecoration(
            //Container样式
            color: Colors.red, // 背景色
            borderRadius: BorderRadius.circular(10.0), // 圆角边框
          ),
        ),
        //   Padding(
        // padding: EdgeInsets.all(44.0),
        // child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。')),
        // Center(child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。')),
      ),
    );
  }
}
