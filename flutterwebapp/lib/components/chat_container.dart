import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import './message_list.dart';
import './emoji_package.dart';
import '../../models/message_list_model.dart';
import '../../widget/popup_window.dart';

class ChatContainer extends StatefulWidget {
  ChatContainer({Key key}) : super(key: key);

  @override
  _ChatContainer createState() => new _ChatContainer();
}

class _ChatContainer extends State<ChatContainer> {
  TextEditingController _textcontroller = new TextEditingController();
  var _webSocketChannel =
      new IOWebSocketChannel.connect('ws://localhost:8080/ws');
  GlobalKey popLeftKey;

  @override
  void initState() {
    super.initState();
    popLeftKey = GlobalKey();
    // 监听消息
    _webSocketChannel.stream.listen((message) {
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
                  PopupWindowButton(
                    offset: Offset(-90, -240),
                    buttonBuilder: (BuildContext context) {
                      return Image.asset(
                        "images/icons/xiaolian.png",
                        width: 22.0,
                      );
                    },
                    windowBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          height: 240,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                                color: Colors.grey[100],
                                width: 3,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Emoji(
                              sendEmoji: (value) => this._sendEmoji(value)));
                    },
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        "images/icons/wenjian.png",
                        width: 22.0,
                      ),
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
                child: TextArea(),
              )
            ],
          )),
    );
  }

  Widget TextArea() => RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.runtimeType == RawKeyDownEvent) {
            if (event.physicalKey == PhysicalKeyboardKey.enter) {
              this._sendText();
            }
          }
        },
        child: Container(
          color: Color.fromRGBO(243, 243, 243, 1.0),
          constraints: BoxConstraints(
            maxHeight: 300.0,
            minHeight: 300.0,
          ),
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0, bottom: 0.0),
          child: TextField(
              controller: _textcontroller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              // 无边框
              decoration: InputDecoration(border: InputBorder.none)),
        ),
      );

  void _sendMessage(value) {
    var data = value.trim();
    if (data.length > 0) {
      var str = json.encode({
        "type": 1,
        "content": data,
        "fromId": 'ivy',
        "toId": 'zhizhuxia',
        "id": DateTime.now().millisecondsSinceEpoch,
      });
      this._webSocketChannel.sink.add(str);
    }
  }

  void _sendText() {
    if (_textcontroller.text.isNotEmpty) {
      this._sendMessage(_textcontroller.text);
      setState(() {
        _textcontroller?.clear();
      });
    }
  }

  void _sendEmoji(value) {
    print(value);
    this._sendMessage(value);
    // 关闭弹窗
    Navigator.pop(context);
  }

  // 监听消息
  void _close() {
    this._webSocketChannel.sink.close().then((value) {
      print("_webSocketChannel关闭");
    });
  }

  @override
  void dispose() {
    this._close();
    super.dispose();
  }
}
