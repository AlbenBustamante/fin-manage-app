import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc/auth_bloc.dart';

class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          String route = '/sign-up';

          if (state is Authenticated) {
            route = '/home';
          }

          Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
        },
        child: Container());
  }
}
