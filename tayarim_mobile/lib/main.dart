import 'package:tayarim_mobile/router/go_router.dart';
import 'package:tayarim_mobile/services/connexion/connexion_bloc.dart';
import 'package:tayarim_mobile/services/inscription/inscription_bloc.dart';
import 'package:tayarim_mobile/services/repository/auth/api_auth_data_source.dart';
import 'package:tayarim_mobile/services/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
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
            BlocProvider<InscriptionBloc>(
              create: (context) => InscriptionBloc(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
          ],
          child: MaterialApp.router(
            title: 'tayarim_mobile',
            routerConfig: router,
          )),
    );
  }
}
