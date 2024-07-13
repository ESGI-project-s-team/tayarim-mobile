part of 'get_notifications_bloc.dart';

enum GetNotificationsStatus {
  initial,
  loading,
  success,
  error,
}

final class GetNotificationsState{
  final GetNotificationsStatus status;
  final List<Notification>? notifications;
  final Object? error;

  GetNotificationsState({
    this.status = GetNotificationsStatus.initial,
    this.notifications,
    this.error,
  });

  GetNotificationsState copyWith({
    GetNotificationsStatus? status,
    List<Notification>? notifications,
    Object? error,
  }) {
    return GetNotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      error: error ?? this.error,
    );
  }
}