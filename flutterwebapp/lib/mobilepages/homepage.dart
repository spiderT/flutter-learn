import 'package:flutter/material.dart';
import '../components/chat_list.dart';
import '../components/empty.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Scaffold(
                appBar: AppBar(
                  title: Text(
                    '微信',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Text(''),
                  backgroundColor: Colors.grey[300],
                ),
                body: ChatList()),
            Empty(title: '通讯录'),
            Empty(title: '发现'),
            Empty(title: ''),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.tag_faces),
              text: "微信",
            ),
            Tab(
              icon: Icon(Icons.people_outline),
              text: "通讯录",
            ),
            Tab(
              icon: Icon(Icons.explore_outlined),
              text: "发现",
            ),
            Tab(
              icon: Icon(Icons.person_outlined),
              text: "我",
            )
          ],
          unselectedLabelColor: Colors.black,
          labelColor: Colors.green,
        ),
      ),
    );
  }
}
