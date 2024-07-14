import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tayarim_mobile/services/repository/notification/notification_repository.dart';
import 'package:tayarim_mobile/utils/card.dart';
import '../router/app_router.gr.dart';
import '../services/connexion/connexion_bloc.dart';
import '../services/get_notifications/get_notifications_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes notifications'),
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
                  onPressed: (() =>
                      context.router.pushNamed('/home')), // MODIFY
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<GetNotificationsBloc, GetNotificationsState>(
        builder: (context, state) {
          switch (state.status) {
            case GetNotificationsStatus.initial:
              _getNotifications(context);
              return const SizedBox();
            case GetNotificationsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GetNotificationsStatus.error:
              return Center(
                child: Text(state.error.toString()),
              );
            case GetNotificationsStatus.success:
              if (state.notifications != null) {
                if (state.notifications!.isEmpty) {
                  return const Center(
                    child: Text('Pas de commentaire ...'),
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListView.separated(
                          itemCount: state.notifications!.length,
                          separatorBuilder: (context, _) => Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          itemBuilder: (context, index) {
                            return NotificationCard(notification: state.notifications![index]);
                          }
                        ),
                      ),
                    ],
                  );
                }
              } else {
                return const SizedBox();
              }
          }
        },
      ),
    );
  }

  void _getNotifications(BuildContext context) {
    print("DEDANS");
    final getNotificationsBloc = BlocProvider.of<GetNotificationsBloc>(context);
    getNotificationsBloc.add(GetNotifications(refresh: true));
  }

  void _signOut(BuildContext context) {
    final connexionBloc = BlocProvider.of<ConnexionBloc>(context);
    connexionBloc.add(Disconnected());
  }
}
