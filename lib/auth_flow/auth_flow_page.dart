import 'dart:developer';

import 'package:finmanageapp/features/auth/presentation/pages/sign_in_page.dart';
import 'package:finmanageapp/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc/auth_bloc.dart';

class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          String route = SignInPage.route;

          if (state is Authenticated) {
            route = HomePage.route;
          }

          log('Route: $route');

          Navigator.popAndPushNamed(context, route);
        },
        child: Container());
  }
}
