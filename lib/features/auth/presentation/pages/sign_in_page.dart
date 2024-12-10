import 'package:finmanageapp/core/config/init_dependencies.dart';
import 'package:finmanageapp/features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:finmanageapp/features/auth/presentation/pages/sign_up_page.dart';
import 'package:finmanageapp/features/auth/presentation/widgets/auth_footer.dart';
import 'package:finmanageapp/features/auth/presentation/widgets/auth_header.dart';
import 'package:finmanageapp/features/home/presentation/pages/home_page.dart';
import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_password_field.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  static const route = '/sign-in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
        create: (context) => ij<SignInBloc>(), child: const _SignInView());
  }
}

class _SignInView extends StatefulWidget {
  const _SignInView();

  @override
  State<_SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<_SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width - 50.0;

    return Scaffold(
        body: BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));

          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.route, (_) => false);
        }

        if (state is Failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            AuthHeader(
                theme: theme,
                title: 'Bienvenido de vuelta',
                subtitle: 'Por favor, ingresa tus datos'),
            const SizedBox(height: 35.0),
            _form(theme, maxWidth, context),
            Divider(height: 75.0, color: Colors.grey[500]),
            AuthFooter(
                theme: theme,
                text: '¿No tienes cuenta?',
                linkText: 'Registrarme',
                route: SignUpPage.route)
          ])),
    ));
  }

  Form _form(ThemeData theme, double maxWidth, BuildContext context) {
    return Form(
        child: Column(children: [
      CustomTextField(
          controller: _emailController,
          theme: theme,
          labelText: 'Email',
          icon: Icons.email_outlined,
          hintText: 'Ingresa tu email'),
      CustomPasswordField(
          controller: _passwordController,
          theme: theme,
          labelText: 'Contraseña'),
      BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return CustomElevatedButton(
              onTap: () {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                context.read<SignInBloc>().add(OnSignIn(email, password));
              },
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              text: 'Iniciar sesión',
              maxWidth: maxWidth,
              loading: state is Loading);
        },
      )
    ]));
  }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
}
