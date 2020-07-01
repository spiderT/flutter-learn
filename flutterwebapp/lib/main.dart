import 'package:flutter/material.dart';
import 'package:flutterwebapp/pages/user_info.dart';
import 'package:flutterwebapp/pages/chat_list.dart';
import 'package:flutterwebapp/pages/chat_container.dart';
import 'package:flutterwebapp/pages/chat_im.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spiderChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            UserInfo(),
            Container(
              width: 260,
              height: double.infinity,
              child: ChatList(),
            ),
            Expanded(
              child: ChatContainer(),
               // child: WebSocketRoute(),
            )
          ],
        ),
      ),
    );
  }
}
