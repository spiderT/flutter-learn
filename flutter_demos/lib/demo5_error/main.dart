import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import './flutter_crash_plugin.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'dart:core';

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
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // debug模式直接打印在控制台
      FlutterError.dumpErrorToConsole(details);
    } else {
      // 在生产模式下,重定向到 runZone 中处理
      Zone.current
          .handleUncaughtError(details.exception, details.stack as StackTrace);
    }
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
        title: Text('Crash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text('Dart exception'),
              onPressed: () {
                throw StateError('This is a Dart exception.');
              },
            ),
            TextButton(
              child: Text('async Dart exception'),
              onPressed: () {
                try {
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
