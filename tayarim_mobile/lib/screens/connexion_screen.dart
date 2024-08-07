import 'package:auto_route/auto_route.dart';
import 'package:tayarim_mobile/models/connexion_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';
import '../services/connexion/connexion_bloc.dart';


@RoutePage()
class ConnexionScreen extends StatelessWidget {
  ConnexionScreen({super.key});

  final _passwordTextController = TextEditingController();

  final _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final i18n = TranslationLoader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 370,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                            'assets/images/white-logo-short-removebg.png',
                            width: 300)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return i18n.getTranslation('sign_in_hint');
                          }
                          return null;
                        },
                        controller: _emailTextController,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return i18n.getTranslation('password_hint');
                          }
                          return null;
                        },
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          hintText: i18n.getTranslation('password'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF1c2434)),
                        ),
                        onPressed: () => _signIn(context),
                        child: Text(
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          i18n.getTranslation('sign_in'),
                        ),
                      ),
                    ),
                    BlocBuilder<ConnexionBloc, ConnexionState>(
                      builder: (context, state) {
                        if (state.status == ConnexionStatus.success) {
                          context.router.pushNamed('/home');
                          return const SizedBox();
                        } else if (state.status == ConnexionStatus.error) {
                          return state.error.toString() != 'null'
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(state.error.toString(),
                                      style:
                                          const TextStyle(color: Colors.red)),
                                )
                              : const SizedBox();
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailTextController.text;
      final String password = _passwordTextController.text;
      final connexionBloc = BlocProvider.of<ConnexionBloc>(context);
      connexionBloc.add(
          ConnexionSubmitted(ConnexionUser(email: email, password: password)));
    }
  }
}
