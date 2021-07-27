import 'package:flutter/material.dart';
import 'counter_model.dart';
import 'package:provider/provider.dart';
import 'test_icon.dart';

class ProviderTabPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<double>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text(
          'Counter: ${_counter.counter}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProviderTabPage2())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class ProviderTabPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<double>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Text(
        'Counter: ${_counter.counter}',
        style: TextStyle(fontSize: textSize),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        child: TestIcon(),
      ),
    );
  }
}
