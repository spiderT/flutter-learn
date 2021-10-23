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
          body: SingleChildScrollView(
            padding: EdgeInsets.all(32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Row'),
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 60,
                    height: 80,
                  ),
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 180,
                  ),
                  Container(
                    color: Colors.black,
                    width: 60,
                    height: 80,
                  ),
                  Container(
                    color: Colors.green,
                    width: 60,
                    height: 80,
                  ),
                ],
              ),
              Text('Column'),
              Column(
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 60,
                    height: 80,
                  ),
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 180,
                  ),
                  Container(
                    color: Colors.black,
                    width: 60,
                    height: 80,
                  ),
                  Container(
                    color: Colors.green,
                    width: 60,
                    height: 80,
                  ),
                ],
              ),
              Text('Expanded'),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.yellow,
                          height: 60)), //设置了flex=1，因此宽度由Expanded来分配
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 180,
                  ),
                  Container(
                    color: Colors.black,
                    width: 60,
                    height: 80,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.green, height: 60),
                  ) //设置了flex=1，因此宽度由Expanded来分配
                ],
              ),
            ]),
          )),
    );
  }
}
