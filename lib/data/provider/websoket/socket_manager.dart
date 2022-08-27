import 'dart:collection';


import 'socket_request.dart';
import 'web_socket.dart';

class SocketManager {

  late final HashMap<String, WebSocket> sockets;
  static final SocketManager _instance = SocketManager._internal();
  SocketManager._internal() {
    sockets = HashMap();
  }
  static SocketManager get getInstance => _instance;


  addWebSocket(String webSocketUrl) async {
    if (!sockets.containsKey(webSocketUrl)) {
      WebSocket socket = WebSocket(webSocketUrl: webSocketUrl);
      socket.connect();
      sockets[webSocketUrl] = socket;
    }
  }

  // TODO close when logout
  closeWebSockets() {
    sockets.forEach((key, socket) { socket.close(); });
  }


  reconnectWebSockets() {
    sockets.forEach((key, socket) { socket.reconnect(); });
  }

  sendRequest(String webSocketUrl, SocketRequest socketRequest) {
    if (sockets.containsKey(webSocketUrl)) {
      sockets[webSocketUrl]?.sendRequest(socketRequest);
    }
  }

}