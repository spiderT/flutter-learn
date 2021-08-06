import 'package:flutter/material.dart';

class ChatItemWidget extends StatefulWidget {
  ChatItemWidget({Key key, this.item}) : super(key: key);
  final item;
  @override
  MessageListState createState() {
    return new MessageListState(item: this.item);
  }
}

class MessageListState extends State<ChatItemWidget> {
  MessageListState({Key key, this.item});
  final item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: item.fromId == 'zhizhuxia'
                ? ListTile(
                    leading: Image.asset(
                      "images/users/${item.fromId}.png",
                      width: 44.0,
                      height: 44.0,
                    ),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Colors.white),
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 280.0,
                                  ),
                                  child: Text(
                                    item.content,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 14.0),
                                  )))
                        ]))
                : ListTile(
                    trailing: Image.asset(
                      "images/users/user.png",
                      width: 44.0,
                      height: 44.0,
                    ),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Color.fromRGBO(158, 231, 101, 1)),
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 280.0,
                                  ),
                                  child: Text(item.content,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ))))
                        ]))),
      ],
    );
  }
}
