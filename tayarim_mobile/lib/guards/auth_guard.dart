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
    final connexionBloc = BlocProvider.of<ConnexionBloc>(context);

    connexionBloc.add(IsConnected(context));

    if (connexionBloc.state.status == ConnexionStatus.success) {
      resolver.next(true);
    } else {
      router.push(ConnexionRoute());
    }
  }
}