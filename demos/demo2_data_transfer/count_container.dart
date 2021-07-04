import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);


  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int count = 0;

  void _incrementCounter() => setState(() {count++;});


  @override
  Widget build(BuildContext context) {

    return CountContainer(
      //increment: _incrementCounter,
        model: this,
        increment: _incrementCounter,
        child:Counter()
    );
  }
}


class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) => context.inheritFromWidgetOfExactType(CountContainer) as CountContainer;

  final _CounterPageState model;

  final Function() increment;


  CountContainer({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model;

}


class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);

    return Scaffold(
      appBar: AppBar(

        title: Text("InheritedWidget demo"),
      ),
      body: Text(
        'You have pushed the button this many times: ${state.model.count}',
      ),
      floatingActionButton: FloatingActionButton(onPressed: state.increment),
    );
  }
}