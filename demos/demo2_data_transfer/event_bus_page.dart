import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:async';


class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

EventBus eventBus = new EventBus();


class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = "通知：";
  StreamSubscription subscription;
  @override
  void initState() {
    //监听CustomEvent事件，刷新UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print(event);
        setState(() {
          msg += event.msg;
        });
    });
    super.initState();
  }

  dispose() {
    subscription.cancel();//State销毁时，清理注册
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page"),),

      body:Text(msg),
        floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage()))),
    );
  }
}

class SecondPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: RaisedButton(
          child: Text('Fire Event'),
          // 触发CustomEvent事件
          onPressed: ()=> eventBus.fire(CustomEvent("hello"))
      ),
    );
  }
}




