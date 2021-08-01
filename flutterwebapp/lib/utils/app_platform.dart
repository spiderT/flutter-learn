import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static bool isMobile() {
    return Platform.isIOS || Platform.isAndroid;
  }

  static bool isWeb() {
    return kIsWeb == true;
  }
}
