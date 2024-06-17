import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tayarim_mobile/router/app_router.gr.dart';
import 'package:tayarim_mobile/services/connexion/connexion_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final BuildContext context;

  AuthGuard({required this.context});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final ConnexionState state = BlocProvider.of<ConnexionBloc>(context).state;
    const bool authenticated = false;

    if (state.status == ConnexionStatus.success) {
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(ConnexionRoute());
    }
  }
}