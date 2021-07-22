import 'package:toast/toast.dart';

class ToastCom {
  static show(String msg, context) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.CENTER,
        backgroundRadius: 4);
  }
}
