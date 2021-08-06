import 'package:flutter/services.dart';

class FlutterCrashPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_crash_plugin');

  static void setUp(appID) {
    _channel.invokeMethod("setUp", {'app_id': appID});
  }

  static void postException(error, stack) {
    _channel.invokeMethod("postException",
        {'crash_message': error.toString(), 'crash_detail': stack.toString()});
  }
}
