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
        // guards: [
        //   ConnectivityGuard(context: context),
        // ],
        page: ConnexionRoute.page,
        path: '/connexion',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
        guards: [
          AuthGuard(context: context),
          // ConnectivityGuard(context:context),
        ],
        page: HomeRoute.page,
        path: '/home',
        initial: true
    ),
    AutoRoute(page: NoConnectionDialog.page, path: '/no_connection'),
  ];
}

// CustomTransitionPage buildPageWithDefaultTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
// }) {
//   return CustomTransitionPage<T>(
//     key: state.pageKey,
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//         context: context,
//         state: state,
//         child: ConnexionScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/sign_in',
//       pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//         context: context,
//         state: state,
//         child: ConnexionScreen(),
//       ),
//     ),
//     GoRoute(path: '/no_connection', pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//       context: context,
//       state: state,
//       child: const NoConnectionDialog(),
//     )),
//   ],
//   redirect: (context, state) async {
//     final connexionBloc = BlocProvider.of<ConnexionBloc>(context);
//     connexionBloc.add(IsConnected(context));
//     print("before");
//
//
//     return null;
//   },
// );
