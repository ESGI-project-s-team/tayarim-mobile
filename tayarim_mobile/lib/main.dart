import 'package:intl/date_symbol_data_local.dart';
import 'package:tayarim_mobile/router/app_router.dart';
import 'package:tayarim_mobile/services/check_connectivity/check_connectivity_bloc.dart';
import 'package:tayarim_mobile/services/connexion/connexion_bloc.dart';
import 'package:tayarim_mobile/services/get_notifications/get_notifications_bloc.dart';
import 'package:tayarim_mobile/services/repository/auth/api_auth_data_source.dart';
import 'package:tayarim_mobile/services/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tayarim_mobile/services/repository/notification/api_notification_data_source.dart';
import 'package:tayarim_mobile/services/repository/notification/notification_repository.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  await TranslationLoader().loadTranslations();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR', null);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            authDataSource: ApiAuthDataSource(),
          ),
        ),
        RepositoryProvider<NotificationRepository>(
            create: (context) => NotificationRepository(
              notificationDataSource: ApiNotificationDataSource(),
            )
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnexionBloc>(
            create: (context) => ConnexionBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<CheckConnectivityBloc>(
            create: (context) => CheckConnectivityBloc(),
          ),
          BlocProvider<GetNotificationsBloc>(
            create: (context) => GetNotificationsBloc(
              notificationRepository: context.read<NotificationRepository>(),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            final appRouter = AppRouter(context: context);
            return MaterialApp.router(
              title: 'tayarim_mobile',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(), // MODIFY
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xff1c2434),
                  surface: const Color(0xfff1f5f9),
                  primary: Colors.black,
                ),
                fontFamily: 'Sans Serif',
              ),
            );
          }
        ),
      ),
    );
  }
}
