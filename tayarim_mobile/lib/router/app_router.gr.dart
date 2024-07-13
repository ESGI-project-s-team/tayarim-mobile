// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:tayarim_mobile/screens/connexion_screen.dart' as _i1;
import 'package:tayarim_mobile/screens/home_screen.dart' as _i2;
import 'package:tayarim_mobile/services/repository/notification/notification_repository.dart'
    as _i6;
import 'package:tayarim_mobile/utils/no_connection_dialog.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ConnexionRoute.name: (routeData) {
      final args = routeData.argsAs<ConnexionRouteArgs>(
          orElse: () => const ConnexionRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ConnexionScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(
          key: args.key,
          notificationRepository: args.notificationRepository,
        ),
      );
    },
    NoConnectionDialog.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NoConnectionDialog(),
      );
    },
  };
}

/// generated route for
/// [_i1.ConnexionScreen]
class ConnexionRoute extends _i4.PageRouteInfo<ConnexionRouteArgs> {
  ConnexionRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ConnexionRoute.name,
          args: ConnexionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ConnexionRoute';

  static const _i4.PageInfo<ConnexionRouteArgs> page =
      _i4.PageInfo<ConnexionRouteArgs>(name);
}

class ConnexionRouteArgs {
  const ConnexionRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ConnexionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    required _i6.NotificationRepository notificationRepository,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            notificationRepository: notificationRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<HomeRouteArgs> page =
      _i4.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.notificationRepository,
  });

  final _i5.Key? key;

  final _i6.NotificationRepository notificationRepository;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, notificationRepository: $notificationRepository}';
  }
}

/// generated route for
/// [_i3.NoConnectionDialog]
class NoConnectionDialog extends _i4.PageRouteInfo<void> {
  const NoConnectionDialog({List<_i4.PageRouteInfo>? children})
      : super(
          NoConnectionDialog.name,
          initialChildren: children,
        );

  static const String name = 'NoConnectionDialog';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
