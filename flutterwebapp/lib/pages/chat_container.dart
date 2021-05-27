import 'package:flutter/material.dart';
import 'package:flutterwebapp/pages/message_list.dart';

class ChatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
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
                  Text(
                    '10:29',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 2,
                      fontSize: 12.0,
                    ),
                  ),
                  Flexible(child: MessageList()),
                ],
              ),
            ),
            Container(
              color: Color.fromRGBO(243, 243, 243, 1.0),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(
                    "images/icons/xiaoxi.png",
                    width: 22.0,
                  ),
                ),
                // Image.asset(
                //   "images/icons/dianhua.png",
                //   width: 22.0,
                // ),
                // Image.asset(
                //   "images/icons/shipin.png",
                //   width: 22.0,
                // ),
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
                  left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
              child: TextField(
                //按回车时调用 ??? 没有用，之后是换行
                onEditingComplete: () {
                  print('onEditingComplete');
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                autofocus: true,
                // 无边框
                decoration: InputDecoration(border: InputBorder.none)
              ),
            ))
          ],
        ));
  }
}
