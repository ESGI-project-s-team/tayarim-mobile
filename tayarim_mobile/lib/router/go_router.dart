import 'dart:async';

import 'package:tayarim_mobile/screens/connexion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../services/connexion/connexion_bloc.dart';
import '../services/check_connectivity/check_connectivity_bloc.dart';
import '../utils/no_connectivity_dialog.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: ConnexionScreen(),
      ),
    ),
    GoRoute(
      path: '/sign_in',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: ConnexionScreen(),
      ),
    ),
    GoRoute(path: '/no_connection', pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const NoConnectionDialog(),
    )),
  ],
  redirect: (context, state) async {
    final connexionBloc = BlocProvider.of<ConnexionBloc>(context);
    connexionBloc.add(IsConnected(context));
    print("before");
    final checkConnectivityBloc = BlocProvider.of<CheckConnectivityBloc>(context);
    checkConnectivityBloc.add(CheckConnectivity(context));
    print("after");
    final status = context.read<CheckConnectivityBloc>().state.status;
    print(status);
    if (status == ConnectivityStatus.disconnected) {
      print("toto");
      return '/no_connection';
    }
    return null;
  },
);
