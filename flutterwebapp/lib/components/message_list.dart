import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import '../widget/chatItem_widget.dart';
import '../utils/socket_channel_platform.dart';

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
  var _webSocketChannel = SocketChannel.getSocketChannel();
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
      itemBuilder: (context, i) => ChatItemWidget(item: dummyData[i]),
    ));
  }
}
