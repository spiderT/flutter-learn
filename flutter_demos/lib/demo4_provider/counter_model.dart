import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get counter => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
