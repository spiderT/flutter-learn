import 'package:flutter/material.dart';
import 'package:flutterwebapp/pages/message_list.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import '../models/message_list_model.dart';

class ChatContainer extends StatefulWidget {
  ChatContainer({Key key}) : super(key: key);

  @override
  _ChatContainer createState() => new _ChatContainer();
}

class _ChatContainer extends State<ChatContainer> {
  TextEditingController _textcontroller = new TextEditingController();
  var _webSocketChannel =
      new IOWebSocketChannel.connect('ws://localhost:8080/ws');

  @override
  void initState() {
    super.initState();
    // 监听消息
    _webSocketChannel.stream.listen((message) {
      // print(json.decode(message));
      var msg = json.decode(message);
      var data = new MsgModel(
        type: msg['type'],
        content: msg['content'],
        fromId: msg['fromId'],
        toId: msg['toId'],
        id: msg['id'],
      );
      setState(() {
        dummyData.add(data);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 243, 243, 1.0),
              border: Border(
                left: BorderSide(
                    color: Color.fromRGBO(214, 214, 214, 1.0),
                    width: 1,
                    style: BorderStyle.solid),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(214, 214, 214, 1.0),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        color: Color.fromRGBO(243, 243, 243, 1.0),
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                        child: Text(
                          '蜘蛛侠',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 2,
                            fontSize: 16.0,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 340,
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1.0),
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(214, 214, 214, 1.0),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(child: MessageList(dummyData: dummyData)),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromRGBO(243, 243, 243, 1.0),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        "images/icons/xiaolian.png",
                        width: 22.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        "images/icons/wenjian.png",
                        width: 22.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        "images/icons/jianqie.png",
                        width: 22.0,
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(243, 243, 243, 1.0),
                    constraints: BoxConstraints(
                      maxHeight: 300.0,
                      minHeight: 300.0,
                    ),
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 0.0, bottom: 0.0),
                    child: TextField(
                        controller: _textcontroller,
                        //按回车时调用 ??? 没有用，是换行
                        // onEditingComplete: () {
                        //   print('onEditingComplete');
                        // },
                        // onSubmitted: (value) {
                        //   print('onSubmitted');
                        // },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        autofocus: true,
                        // 无边框
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                )
              ],
            )),
        floatingActionButton: new FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'Send message',
          child: new Text("发送"),
        ));
  }

  void _sendMessage() {
    if (_textcontroller.text.isNotEmpty) {
      var str = json.encode({
        "type": 1,
        "content": _textcontroller.text,
        "fromId": 'ivy',
        "toId": 'zhizhuxia',
        "id": DateTime.now().millisecondsSinceEpoch,
      });
      setState(() {
        _textcontroller?.clear();
      });
      this._webSocketChannel.sink.add(str);
    }
  }

  // 监听消息
  void _close() {
    this._webSocketChannel.sink.close().then((value) {
      print("关闭");
    });
  }

  @override
  void dispose() {
    this._close();
    super.dispose();
  }
}
