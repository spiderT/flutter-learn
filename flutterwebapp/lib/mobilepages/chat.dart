import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/html.dart';
import 'dart:convert';
import '../components/message_list.dart';
import '../../models/message_list_model.dart';
import '../utils/app_platform.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatContainer createState() => new _ChatContainer();
}

class _ChatContainer extends State<Chat> {
  TextEditingController _textcontroller = new TextEditingController();
  var _webSocketChannel;
  GlobalKey popLeftKey;

  @override
  void initState() {
    super.initState();
    popLeftKey = GlobalKey();
    print('AppPlatform.isWeb()');
    print(AppPlatform.isWeb());
    if (AppPlatform.isWeb()) {
      _webSocketChannel =
          new HtmlWebSocketChannel.connect('ws://localhost:8080/ws');
    } else {
      _webSocketChannel =
          new IOWebSocketChannel.connect('ws://localhost:8080/ws');
    }
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
      appBar: AppBar(
        title: Text(
          '蜘蛛侠',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[300],
      ),
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
                height: 640,
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
