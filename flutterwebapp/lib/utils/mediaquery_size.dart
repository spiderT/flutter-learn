import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MediaQuerySize {
  static bool isMobileLayout(context) {
    final screenSize = MediaQuery.of(context).size;
    print('屏幕 Size -> ${screenSize}');

    const int mobizeWith = 400;
    return screenSize.width <= mobizeWith;
  }

  static double getLoginPadding(context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.width < 500 ? screenSize.width / 2 : 500;
  }
}
