import 'package:flutter/material.dart';
import '../utils/mediaquery_size.dart';
import '../../models/chat_list_model.dart';

class ChatList extends StatefulWidget {
  ChatList({Key key}) : super(key: key);

  @override
  ChatListState createState() {
    return new ChatListState();
  }
}

class ChatListState extends State<ChatList> {
  int _operation = 0;

  void _handleTap(data) {
    setState(() {
      _operation = data;
      print(_operation);
    });
    if (MediaQuerySize.isMobileLayout(context)) {
      Navigator.pushNamed(context, 'chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 1.0,
          ),
          new Container(
              color: _operation == i
                  ? Color.fromRGBO(243, 243, 243, 1.0)
                  : Colors.white,
              child: new ListTile(
                leading: Image.asset(
                  dummyData[i].avatarUrl,
                  width: 44.0,
                  height: 44.0,
                ),
                onTap: () => _handleTap(i),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      dummyData[i].name,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    new Text(
                      '2021/08/01',
                      style: new TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    '您已添加了${dummyData[i].name}，现在可以开始聊天了。',
                    style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
