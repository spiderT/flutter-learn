import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    default:
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFD63031),
          body: Center(
            child: Text(
              'Hello from Flutter',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );
  }
}
