import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
part 'websocket_event.dart';
part 'websocket_state.dart';

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  late WebSocketChannel channel;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  WebSocketBloc(this.flutterLocalNotificationsPlugin) : super(WebSocketInitial()) {
    on<ConnectWebSocket>((event, emit) {
      _connectWebSocket(event.token);
      emit(WebSocketConnected());
    });

    on<ReceiveMessage>((event, emit) {
      _showNotification(event.message);
      emit(WebSocketMessageReceived(event.message));
    });
  }

  void _connectWebSocket(String token) {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://your.websocket.server'),
    );
    channel.sink.add('Connexion: Bearer $token');

    channel.stream.listen((message) {
      add(ReceiveMessage(message));
    });
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Message',
      message,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }
}