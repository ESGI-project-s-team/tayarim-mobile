
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
part 'check_connectivity_event.dart';
part 'check_connectivity_state.dart';

class CheckConnectivityBloc extends Bloc<CheckConnectivityEvent, CheckConnectivityState> {
  CheckConnectivityBloc() : super(CheckConnectivityState()) {
    on<CheckConnectivity>(_onCheckConnectivity);
  }

  void _onCheckConnectivity(CheckConnectivity event, Emitter<CheckConnectivityState> emit) async {
    emit(state.copyWith(status: ConnectivityStatus.connected));
    print("cheking connectivity");
    try {
      state.copyWith(isFinished: false);
      List<ConnectivityResult> result = await Connectivity().checkConnectivity();
      print(result);

      if (result.contains(ConnectivityResult.none)) {
        print("Not connected");
        state.copyWith(isFinished: true);
        emit(state.copyWith(status: ConnectivityStatus.disconnected));
      } else {
        print("Connected");
        state.copyWith(isFinished: true);
        emit(state.copyWith(status: ConnectivityStatus.connected));
      }
    } catch (error) {
      state.copyWith(isFinished: true);
      emit(state.copyWith(status: ConnectivityStatus.disconnected));
    }
  }
}