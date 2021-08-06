import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import '../../models/message_list_model.dart';
import '../widget/chatItem_widget.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _webSocketChannel =
      new IOWebSocketChannel.connect('ws://localhost:8080/ws');

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
    _focusNode.addListener(textFocusListener);
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

      var scrollHight = dummyData.length * 44 + 0.0;
      print(scrollHight);
      if (scrollHight > 250) {
        // todo 有弹跳动画
        _scrollController.jumpTo(scrollHight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '蜘蛛侠',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Color(0xFFF3F3F3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 10),
                itemBuilder: (context, i) => ChatItemWidget(item: dummyData[i]),
                controller: _scrollController,
                itemCount: dummyData.length,
              ),
            ),
          ),
          editMessageWidget(),
        ],
      ),
    );
  }

  Widget editMessageWidget() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: _sendText,
              child: Container(
                  height: 30,
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "发送",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      print('scrollListener');
    }
  }

  void textFocusListener() {
    _scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _sendText() {
    if (_textEditingController.text.isNotEmpty) {
      this._sendMessage(_textEditingController.text);
      setState(() {
        _textEditingController?.clear();
      });
    }
  }

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
