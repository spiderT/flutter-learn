import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:io';

class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() => new _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";
  List<Object> msgs = new List();

  @override
  void initState() {
    //创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://localhost:8080/ws');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WebSocket(内容回显)"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            new StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                //网络不通会走到这
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                  msgs.add(snapshot.data);
                  print(msgs);
                  print(snapshot);
                }
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(_text),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      print(_controller.text);
      // type: 1,
      // content: 'hello',
      // fromId: 'me',
      // toId: 'zhizhuxia',
      // id: 12345623456781,

      // var str = JSON.encode({
      //   "type": 1,
      //   "content": _controller.text,
      //   "fromId": 'me',
      //   "toId": 'zhizhuxia',
      //   "id": DateTime.now().millisecondsSinceEpoch,
      // })

      // channel.sink.add(str);
      channel.sink.add(_controller.text);
    }
  }

  // @override
  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }
}
