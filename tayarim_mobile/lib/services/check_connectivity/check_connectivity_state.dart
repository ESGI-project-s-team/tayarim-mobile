part of 'check_connectivity_bloc.dart';

enum ConnectivityStatus {
  initial,
  loading,
  connected,
  disconnected,
}

final class CheckConnectivityState {
  final ConnectivityStatus status;

  CheckConnectivityState({
    this.status = ConnectivityStatus.initial,
  });

  CheckConnectivityState copyWith({
    ConnectivityStatus? status,
  }) {
    return CheckConnectivityState(
      status: status ?? this.status,
    );
  }
}