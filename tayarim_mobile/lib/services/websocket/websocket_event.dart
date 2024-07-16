part of 'websocket_bloc.dart';

abstract class WebSocketEvent {}

class ConnectWebSocket extends WebSocketEvent {
  final String token;
  ConnectWebSocket(this.token);
}

class ReceiveMessage extends WebSocketEvent {
  final String message;
  ReceiveMessage(this.message);
}