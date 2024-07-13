part of 'get_notifications_bloc.dart';

abstract class GetNotificationsEvent {}

class GetNotifications extends GetNotificationsEvent {
  final bool refresh;

  GetNotifications({this.refresh = false});
}
