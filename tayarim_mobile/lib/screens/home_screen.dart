import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../router/app_router.gr.dart';
import '../services/connexion/connexion_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Mes logements'),
        centerTitle: true,
        actions: [
          BlocBuilder<ConnexionBloc, ConnexionState>(
            builder: (context, state) {
              if (state.user != null) {
                return IconButton(
                  icon: const Icon(Icons.power_off_outlined),
                  onPressed: (() => _signOut(context)),
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.power),
                  onPressed: (() => context.router.pushNamed('/home')), // MODIFY
                );
              }
            },
          ),
        ],
      ),

    );
  }

  void _signOut(BuildContext context) {
    final connexionBloc = BlocProvider.of<ConnexionBloc>(context);
    connexionBloc.add(Disconnected());
  }
}
