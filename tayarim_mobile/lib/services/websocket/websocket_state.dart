part of 'websocket_bloc.dart';

class WebSocketState {}

class WebSocketInitial extends WebSocketState {}

class WebSocketConnected extends WebSocketState {}

class WebSocketMessageReceived extends WebSocketState {
  final String message;

  WebSocketMessageReceived(this.message);
}
