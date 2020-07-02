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
                  child: dummyData[i].fromId == 'zhizhuxia'
                      ? new ListTile(
                          leading: Image.asset(
                            "images/users/${dummyData[i].fromId}.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          title: new Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(8.0)),
                                  color: Colors.white),
                              child: new Text(
                                dummyData[i].content,
                                textAlign: TextAlign.left,
                                style: new TextStyle(fontSize: 12.0),
                              )))
                      : new ListTile(
                          trailing: Image.asset(
                            "images/users/user.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          title: new Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(8.0)),
                                  color: Color.fromRGBO(158, 231, 101, 1)),
                              child: new Text(dummyData[i].content,
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  )))))
            ],
          ),
        ));
  }
}
