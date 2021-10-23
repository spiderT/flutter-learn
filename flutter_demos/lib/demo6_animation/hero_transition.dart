import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page1'),
        ),
        body: GestureDetector(
          child: Row(
            children: <Widget>[
              Hero(
                  tag: 'hero',
                  child:
                      Container(width: 100, height: 100, child: FlutterLogo())),
              Text('点击Logo查看Hero效果')
            ],
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Page2()));
          },
        ));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page2'),
        ),
        body: Hero(
            tag: 'hero',
            child: Container(width: 300, height: 300, child: FlutterLogo())));
  }
}
