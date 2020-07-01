import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 70, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              "images/users/user.png",
              width: 44.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/icons/bubble_green.png",
                    width: 26.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/icons/lianxiren.png",
                    width: 26.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/icons/lifangti.png",
                    width: 26.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 140, 10, 40),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/icons/shouji.png",
                    width: 22.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/icons/santiaogang.png",
                    width: 22.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}