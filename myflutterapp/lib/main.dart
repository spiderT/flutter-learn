import 'package:flutter/material.dart';
import 'package:spiderChat/pages/user_info.dart';
import 'package:spiderChat/pages/chat_list.dart';
import 'package:spiderChat/pages/chat_container.dart';

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
            ChatContainer()
          ],
        ),
      ),
    );
  }
}
