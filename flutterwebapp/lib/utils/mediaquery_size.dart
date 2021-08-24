import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MediaQuerySize {
  static bool isMobileLayout(context) {
    final screenSize = MediaQuery.of(context).size;
    print('屏幕 Size -> ${screenSize}');

    const int mobizeWith = 500;
    return screenSize.width <= mobizeWith;
  }

  static double getLoginPaddingLeft(context) {
    final width = MediaQuery.of(context).size.width;
    return width - 400;
  }

  static double getLoginPaddingTop(context) {
    final height = MediaQuery.of(context).size.height;
    return height - 400;
  }
}
