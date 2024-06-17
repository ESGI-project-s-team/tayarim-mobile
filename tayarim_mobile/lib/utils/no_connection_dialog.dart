import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/check_connectivity/check_connectivity_bloc.dart';

@RoutePage()
class NoConnectionDialog extends StatelessWidget {
  const NoConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('No Internet Connection'),
      content: const Text('You are not connected to the internet. Please check your connection.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            final checkConnectivityBloc = BlocProvider.of<CheckConnectivityBloc>(context);
            checkConnectivityBloc.add(CheckConnectivity(context));
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}