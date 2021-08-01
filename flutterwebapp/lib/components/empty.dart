import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  Empty({Key key, this.title}) : super(key: key);
  String title;
  @override
  MyHomePage createState() {
    return new MyHomePage(title: this.title);
  }
}

class MyHomePage extends State<Empty> {
  MyHomePage({Key key, this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: title.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                title: Text(title),
                backgroundColor: Colors.grey[300],
              ),
              body: Center(child: const Text('敬请期待...')),
            )
          : Scaffold(
              body: Center(child: const Text('敬请期待...')),
            ),
    );
  }
}
