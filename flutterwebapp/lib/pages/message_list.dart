import 'package:flutter/material.dart';
import '../models/message_list_model.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  MessageListState createState() {
    return new MessageListState();
  }
}

class MessageListState extends State<MessageList> {
  int _operation = 0;

  void _handleTap(data) {
    setState(() {
      _operation = data;
      print(_operation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.0,
        child: new ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Container(
                  child: new ListTile(
                      leading: Image.asset(
                        "images/users/${dummyData[i].fromId}-big.png",
                        width: 44.0,
                        height: 44.0,
                      ),
                      title: new Text(
                        dummyData[i].content,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      )))
            ],
          ),
        ));
  }
}
