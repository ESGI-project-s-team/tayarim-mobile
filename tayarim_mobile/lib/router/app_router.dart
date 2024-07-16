import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tayarim_mobile/router/app_router.gr.dart';

import '../guards/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final BuildContext context;

  AppRouter({required this.context});

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    CustomRoute(
        page: ConnexionRoute.page,
        path: '/connexion',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
        guards: [
          AuthGuard(context: context),
        ],
        page: HomeRoute.page,
        path: '/home',
        initial: true
    ),
    AutoRoute(page: NoConnectionDialog.page, path: '/no_connection'),
  ];
}