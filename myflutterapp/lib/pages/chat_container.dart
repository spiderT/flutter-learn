import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(243, 243, 243, 1.0),
          width: 400,
          child: Text(
            '蜘蛛侠',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 2,
              fontSize: 16.0,
            ),
          ),
        ),
        Container(
          width: 400,
          height: 400,
          padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
          color: Color.fromRGBO(243, 243, 243, 1.0),
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
              Container(
                child: Row(children: <Widget>[
                  Image.asset(
                    "images/users/zhizhuxia.png",
                    width: 22.0,
                  ),
                  Text(
                    '你好，我是蜘蛛侠，很高兴认识你。',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 2,
                        fontSize: 12.0,
                        backgroundColor: Colors.white),
                  )
                ]),
              ),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '我也很高兴认识你。',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 2,
                            fontSize: 12.0,
                            backgroundColor: Color.fromRGBO(156, 231, 111, 1)),
                      ),
                      Image.asset(
                        "images/users/user.png",
                        width: 22.0,
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 260, 20, 0),
                color: Color.fromRGBO(243, 243, 243, 1.0),
                child: Row(children: <Widget>[
                  Image.asset(
                    "images/icons/xiaolian.png",
                    width: 22.0,
                  ),
                  Image.asset(
                    "images/icons/wenjian.png",
                    width: 22.0,
                  ),
                  Image.asset(
                    "images/icons/jianqie.png",
                    width: 22.0,
                  ),
                  Image.asset(
                    "images/icons/xiaoxi.png",
                    width: 22.0,
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
            ],
          ),
        ),
      ],
    );
  }
}
