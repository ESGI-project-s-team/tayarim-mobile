part of 'check_connectivity_bloc.dart';

@immutable
abstract class CheckConnectivityEvent {}

class CheckConnectivity extends CheckConnectivityEvent {
  CheckConnectivity(BuildContext context);
}