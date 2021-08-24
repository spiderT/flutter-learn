import 'package:web_socket_channel/web_socket_channel.dart';

class SocketChannel {
  static getSocketChannel() {
    return new WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws'));
  }
}
