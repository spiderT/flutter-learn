import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static bool isWeb() {
    return kIsWeb == true;
  }

  static bool isMobile() {
    return isWeb() ? false : Platform.isIOS || Platform.isAndroid;
  }
}
