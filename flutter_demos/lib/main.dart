import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter_crash_plugin/flutter_crash_plugin.dart';
import 'dart:io';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Reports [error] along with its [stackTrace] to Bugly.
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  print('Reporting to Bugly...');

  FlutterCrashPlugin.postException(error, stackTrace);
}

Future<Null> main() async {
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print(flutterErrorDetails.toString());
    return Scaffold(
        body: Center(
      child: Text("Custom Error Widget"),
    ));
  };

  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
  // This widget is the root of your application.

}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      FlutterCrashPlugin.setUp('43eed8b173');
    } else if (Platform.isIOS) {
      FlutterCrashPlugin.setUp('088aebe0d5');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      appBar: AppBar(
        title: Text('Crashy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Dart exception'),
              elevation: 1.0,
              onPressed: () {
                throw StateError('This is a Dart exception.');
              },
            ),
            new RaisedButton(
              child: Text('async Dart exception'),
              elevation: 1.0,
              onPressed: () {
                try {
                  //Future.delayed(Duration(seconds: 1)).then((e) => Future.error("This is an async Dart exception."));
                  Future.delayed(Duration(seconds: 1)).then((e) =>
                      throw StateError('This is a Dart exception in Future.'));
                } catch (e) {
                  print("This line will never be executed. ");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
