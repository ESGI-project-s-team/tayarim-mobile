import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tayarim_mobile/router/app_router.gr.dart';
import 'package:tayarim_mobile/services/check_connectivity/check_connectivity_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final BuildContext context;

  AuthGuard({required this.context});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final CheckConnectivityState state = BlocProvider.of<CheckConnectivityBloc>(context).state;
    const bool authenticated = false;

    if (state.status == ConnectivityStatus.connected) {
      resolver.next(true);
    } else {
      router.push(const NoConnectionDialog());
    }
  }
}