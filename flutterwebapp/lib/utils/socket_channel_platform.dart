import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/html.dart';
import './app_platform.dart';

class SocketChannel {
  static getSocketChannel() {
    if (AppPlatform.isWeb()) {
      return new HtmlWebSocketChannel.connect('ws://localhost:8080/ws');
    } else {
      return new IOWebSocketChannel.connect('ws://localhost:8080/ws');
    }
  }
}
