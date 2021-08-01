import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      //路由表
      routes: {
        "second_page": (context) => const SecondPage(),
        "third_page": (context) => const ThirdPage()
      },
      //路由异常页面
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => const UnknownPage()),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
              color: Colors.blue,
              child: const Text('基本路由'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondPage()))),
          MaterialButton(
              color: Colors.blue,
              child: const Text('命名路由'),
              onPressed: () => Navigator.pushNamed(context, "second_page")),
          MaterialButton(
            color: Colors.blue,
            child: const Text('命名路由（参数&回调）'),
            onPressed: () =>
                Navigator.pushNamed(context, "third_page", arguments: "Hey")
                    .then((msg) {
              setState(() {
                _msg = msg.toString();
              });
            }),
          ),
          Text('Message from Second screen: $_msg'),
          MaterialButton(
              color: Colors.blue,
              child: const Text('命名路由异常处理'),
              onPressed: () => Navigator.pushNamed(context, "unknown_page"))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: MaterialButton(
          color: Colors.blue,
          child: const Text('Back to first screen'),
          onPressed: () => Navigator.pop(context)),
    );
  }
}

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unknown Screen'),
      ),
      body: MaterialButton(
          color: Colors.blue,
          child: const Text('Back'),
          onPressed: () => Navigator.pop(context)),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Column(
        children: <Widget>[
          Text('Message from first screen: $msg'),
          MaterialButton(
              color: Colors.blue,
              child: const Text('back'),
              onPressed: () => Navigator.pop(context, "Hi"))
        ],
      ),
    );
  }
}
