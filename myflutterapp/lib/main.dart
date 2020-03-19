import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spiderChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image.asset(
                      "images/users/user.png",
                      width: 44.0,
                    ),
                    Image.asset(
                      "images/icons/bubble_green.png",
                      width: 26.0,
                    ),
                    Image.asset(
                      "images/icons/lianxiren.png",
                      width: 26.0,
                    ),
                    Image.asset(
                      "images/icons/lifangti.png",
                      width: 26.0,
                    ),
                    Image.asset(
                      "images/icons/shouji.png",
                      width: 20.0,
                    ),
                    Image.asset(
                      "images/icons/santiaogang.png",
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.red,
              // width: double.infinity,
              // height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("right "),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
