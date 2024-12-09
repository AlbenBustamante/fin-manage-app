import 'package:finmanageapp/features/auth/presentation/pages/sign_in_page.dart';
import 'package:finmanageapp/features/home/presentation/pages/new_expense_page.dart';
import 'package:finmanageapp/features/home/presentation/pages/new_income_page.dart';

import 'auth_flow/auth_flow_page.dart';
import 'core/config/init_dependencies.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'auth_flow/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthBloc>(
        create: (context) => AuthBloc(ij<AuthRepository>()),
        child: const MyAppView());
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _theme(),
        debugShowCheckedModeBanner: false,
        title: "FinManage",
        onGenerateRoute: _routes);
  }

  Route _routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _route(const AuthFlowPage());
      case SignUpPage.route:
        return _route(const SignUpPage());
      case SignInPage.route:
        return _route(const SignInPage());
      case HomePage.route:
        return _route(const HomePage());
      case NewIncomePage.route:
        return _route(const NewIncomePage());
      case NewExpensePage.route:
        return _route(NewExpensePage());
      default:
        return _route(const AuthFlowPage());
    }
  }

  Route _route(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  ThemeData _theme() {
    return ThemeData(
        colorScheme: ColorScheme.light(
            surface: Colors.grey.shade100, primary: Colors.deepPurple[700]!),
        textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900]),
            titleMedium: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey[700]),
            labelMedium:
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600]),
            bodySmall: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700])));
  }
}
