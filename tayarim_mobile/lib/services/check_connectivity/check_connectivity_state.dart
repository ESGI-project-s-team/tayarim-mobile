part of 'check_connectivity_bloc.dart';

enum ConnectivityStatus {
  initial,
  connected,
  disconnected,
}

final class CheckConnectivityState {
  final ConnectivityStatus status;
  final bool isFinished;

  CheckConnectivityState({
    this.status = ConnectivityStatus.initial,
    this.isFinished = false,
  });

  CheckConnectivityState copyWith({
    ConnectivityStatus? status,
    bool? isFinished,
  }) {
    return CheckConnectivityState(
      status: status ?? this.status,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}