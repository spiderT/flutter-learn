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
          body: Stack(
            children: [
              Container(color: Colors.yellow, width: 300, height: 300),
              Positioned(
                left: 18.0,
                top: 18.0,
                child: Container(color: Colors.green, width: 50, height: 50),
              ),
              Positioned(
                left: 18.0,
                top: 200.0,
                child: Text("Stack提供了层叠布局的容器"),
              )
            ],
          )),
    );
  }
}
