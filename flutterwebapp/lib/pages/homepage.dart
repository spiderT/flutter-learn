import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './components/user_info.dart';
import './components/chat_list.dart';
import './components/chat_container.dart';

class HomePage extends StatelessWidget {
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
              // child: ChatIM(),
            )
          ],
        ),
      ),
    );
  }
}
