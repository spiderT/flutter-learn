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
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, i) => Column(
            children: <Widget>[
              Container(
                  child: dummyData[i].fromId == 'zhizhuxia'
                      ? ListTile(
                          leading: Image.asset(
                            "images/users/${dummyData[i].fromId}.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        color: Colors.white),
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 280.0,
                                        ),
                                        child: Text(
                                          dummyData[i].content,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 12.0),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        color:
                                            Color.fromRGBO(158, 231, 101, 1)),
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 280.0,
                                        ),
                                        child: Text(dummyData[i].content,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ))))
                              ])))
            ],
          ),
        ));
  }
}
