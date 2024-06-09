import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
part 'check_connectivity_event.dart';
part 'check_connectivity_state.dart';

class CheckConnectivityBloc extends Bloc<CheckConnectivityEvent, CheckConnectivityState> {
  CheckConnectivityBloc() : super(CheckConnectivityState()) {
    on<CheckConnectivity>(_onCheckConnectivity);
  }

  void _onCheckConnectivity(CheckConnectivity event, Emitter<CheckConnectivityState> emit) async {
    emit(state.copyWith(status: ConnectivityStatus.connected));
    try {
      ConnectivityResult result = (await Connectivity().checkConnectivity()) as ConnectivityResult;
      if (result == ConnectivityResult.none) {
        emit(state.copyWith(status: ConnectivityStatus.disconnected));
      } else {
        emit(state.copyWith(status: ConnectivityStatus.connected));
      }
    } catch (error) {
      emit(state.copyWith(status: ConnectivityStatus.disconnected));
    }
  }
}