import 'package:bloc/bloc.dart';

import '../../models/notification.dart';
import '../repository/notification/notification_repository.dart';

part 'get_notifications_event.dart';
part 'get_notifications_state.dart';

class GetNotificationsBloc extends Bloc<GetNotificationsEvent, GetNotificationsState> {
  final NotificationRepository notificationRepository;

  GetNotificationsBloc({required this.notificationRepository}) : super(GetNotificationsState()) {
    on<GetNotifications>(_onGetNotifications);
  }

  void _onGetNotifications(GetNotifications event, Emitter<GetNotificationsState> emit) async {
    try {
      List<Notification> notifications;

      if (event.refresh) {
        emit(state.copyWith(status: GetNotificationsStatus.loading));
        notifications = await notificationRepository.getNotifications();
      } else {
        notifications = await notificationRepository.getNotifications();
        notifications.addAll(state.notifications ?? []);
      }
      emit(state.copyWith(
        status: GetNotificationsStatus.success,
        notifications: notifications,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: GetNotificationsStatus.error,
        error: error,
      ));
    }
  }
}