import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';

class ChatIM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return new MaterialApp(
      title: title,
      home: new MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = new TextEditingController();

  /// 连接状态  false 未连接 true 已连接
  bool _status = false;

  ///
  var _webSocketChannel =
      new IOWebSocketChannel.connect('ws://localhost:8080/ws');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          this._status == true
                              ? "websocket已连接"
                              : "websocket已关闭",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: this._status == true
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      ),
                      Container(
                        child: Switch(
                            activeColor: this._status == true
                                ? Colors.green
                                : Colors.red,
                            value: this._status,
                            onChanged: (value) {
                              setState(() {
                                this._status = !this._status;
                                if (this._status == false) {
                                  this._controller.text = "";
                                  this._close();
                                } else {
                                  this._webSocketChannel =
                                      new IOWebSocketChannel.connect(
                                          'ws://localhost:8080/ws');
                                  print("已连接");
                                }
                              });
                            }),
                      )
                    ],
                  )),
              this._status == true
                  ? new Form(
                      child: new TextFormField(
                        controller: _controller,
                        decoration: new InputDecoration(labelText: '发送给服务器'),
                      ),
                    )
                  : Text(""),
              this._status == true
                  ? new StreamBuilder(
                      stream: this._status == true
                          ? this._webSocketChannel.stream
                          : null,
                      builder: (context, snapshot) {
                        print(snapshot);
                        return new Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: new Text(
                              snapshot.hasData ? '服务器返回: ${snapshot.data}' : '',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black38),
                            ));
                      })
                  : Text("")
            ],
          ),
        ),
        floatingActionButton: this._status == true
            ? new FloatingActionButton(
                onPressed: _sendMessage,
                tooltip: 'Send message',
                child: new Text("发送"),
              )
            : Text(""));
  }

  void _sendMessage() {
    print(1);
    if (_controller.text.isNotEmpty) {
      print(_controller.text);
      this._webSocketChannel.sink.add(_controller.text);
    }
  }

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
