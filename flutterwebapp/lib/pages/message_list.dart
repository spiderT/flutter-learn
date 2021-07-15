import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key, this.dummyData}) : super(key: key);
  final List dummyData;
  @override
  MessageListState createState() {
    return new MessageListState(dummyData: this.dummyData);
  }
}

class MessageListState extends State<MessageList> {
  MessageListState({Key key, this.dummyData});
  final List dummyData;
  ScrollController _controller = new ScrollController();
  var _webSocketChannel =
      new IOWebSocketChannel.connect('ws://localhost:8080/ws');
  @override
  void initState() {
    super.initState();
    // 监听消息 自动滚动视图
    _webSocketChannel.stream.listen((message) {
      // int 转换为double， _controller.animateTo的参数要求是double
      var scrollHight = dummyData.length * 44 + 0.0;
      print(scrollHight);
      if (scrollHight > 250) {
        // todo 有弹跳动画
        _controller.jumpTo(scrollHight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
      controller: _controller,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: Color.fromRGBO(158, 231, 101, 1)),
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: 280.0,
                                    ),
                                    child: Text(dummyData[i].content,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ))))
                          ]))),
        ],
      ),
    ));
  }
}
