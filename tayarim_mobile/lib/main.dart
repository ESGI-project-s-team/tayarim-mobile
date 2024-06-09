import 'package:tayarim_mobile/router/go_router.dart';
import 'package:tayarim_mobile/services/check_connectivity/check_connectivity_bloc.dart';
import 'package:tayarim_mobile/services/connexion/connexion_bloc.dart';
import 'package:tayarim_mobile/services/repository/auth/api_auth_data_source.dart';
import 'package:tayarim_mobile/services/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            authDataSource: ApiAuthDataSource(),
          ),
        ),
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
        ],
        child: MaterialApp.router(
          title: 'tayarim_mobile',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff1c2434),
              background: const Color(0xfff1f5f9),
              primary: Colors.black,
            ),
            fontFamily: 'Sans Serif',
          ),
        ),
      ),
    );
  }
}
