import 'dart:convert';
import 'package:callimoo/data/base/pref_key.dart';
import 'package:callimoo/main.dart';
import "package:flutter/foundation.dart" show kIsWeb;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../../../logic/util/logger.dart';
import 'socket_event.dart';
import 'socket_listener.dart';
import 'socket_request.dart';

class WebSocket extends WebSocketAction {
  late var channel;
  String webSocketUrl;

  WebSocket({required this.webSocketUrl});

  connect() {
    Logger.warning("SOCKET: connect state", "");
    Map<String, String> header = Map();
    header["Authorization"] =
        "Bearer ${Callimoo.config.get(PrefKey.ACCESS_TOKEN)}";
    if (kIsWeb) {
      print(webSocketUrl);
      channel = WebSocketChannel.connect(Uri.parse(
          "wss://${Callimoo.config.get(PrefKey.ACCESS_TOKEN)}@${webSocketUrl.replaceAll("wss://", "")}"));
    } else {
      channel = IOWebSocketChannel.connect(webSocketUrl, headers: header);
    }
    channel.stream.listen(onMessageReceived, onError: (e) {
      print("Socket: reconnect");
    });
  }

  close() {
    Logger.warning("SOCKET: close state", "");
    channel.sink.close(status.goingAway);
  }

  reconnect() {
    Logger.warning("SOCKET: reconnect state", "");
    close();
    connect();
  }

  sendRequest(SocketRequest socketRequest) {
    try {} catch (error) {
      Logger.error('SOCKET', "Error $error");
    }
  }

  onMessageReceived(dynamic message) {
    try {
      if (message.toString().startsWith('{')) {
        var body = json.decode(message);
        filteringWebSocketState(body['event'], json.encode(body['data']));
      }
    } catch (error) {
      print("SOCKET: Error $error Data: $message");
    }
  }

  filteringWebSocketState(String state, dynamic data) {
    Logger.success('SOCKET', ["State: $state", "Data: $data"]);
    if (state == SocketEvent.MESSAGE_CREATED.event) {
      onMessageCreated(data);
    } else if (state == SocketEvent.USER_UNREADS.event) {
      onUserUnread(data);
    } else if (state == SocketEvent.CONVERSATION_VIEWED.event) {
      onConversationViewed(data);
    } else if (state == SocketEvent.MESSAGE_EDITED.event) {
      onMessageEdited(data);
    } else if (state == SocketEvent.MESSAGE_DELETED.event) {
      onMessageDeleted(data);
    } else if (state == SocketEvent.TYPING.event) {
      onTyping(data);
    } else if (state == SocketEvent.USER_STATUS_UPDATED.event) {
      onUserStatusChange(data);
    } else if (state == SocketEvent.CONVERSATION_CREATED.event) {
      onConversationCreated(data);
    } else if (state == SocketEvent.ADDED_TO_CONVERSATION.event) {
      onAddToConversation(data);
    } else if (state == SocketEvent.INVITED_TO_WORKSPACE.event) {
      onInvatedToWorkspace(data);
    }
  }
}
