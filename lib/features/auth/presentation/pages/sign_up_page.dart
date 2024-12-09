import 'package:finmanageapp/features/auth/presentation/widgets/auth_footer.dart';
import 'package:finmanageapp/features/auth/presentation/widgets/auth_header.dart';
import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_password_field.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:finmanageapp/core/config/init_dependencies.dart';
import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';
import 'package:finmanageapp/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/sign-up';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) => ij<SignUpBloc>(), child: const _SignUpPageView());
  }
}

class _SignUpPageView extends StatefulWidget {
  const _SignUpPageView();

  @override
  State<_SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<_SignUpPageView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width - 50.0;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));

            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          }

          if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            AuthHeader(
                theme: theme,
                title: 'Crea una cuenta',
                subtitle: 'Por favor, ingresa tus datos'),
            const SizedBox(height: 35.0),
            _form(context, theme, maxWidth),
            Divider(height: 75.0, color: Colors.grey[500]),
            AuthFooter(
                theme: theme,
                text: '¿Ya tienes cuenta? ',
                linkText: 'Inicia sesión')
          ]),
        ),
      ),
    );
  }

  Form _form(BuildContext context, ThemeData theme, double maxWidth) {
    return Form(
        child: Column(children: [
      CustomTextField(
          controller: _nameController,
          theme: theme,
          labelText: 'Nombre',
          icon: Icons.person,
          hintText: 'Ingresa tu nombre'),
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
      CustomPasswordField(
          controller: _repeatPasswordController,
          theme: theme,
          labelText: 'Repite tu contraseña'),
      SizedBox(
        width: maxWidth,
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomElevatedButton(
                onTap: () {
                  final name = _nameController.text.trim();
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();

                  final user = UserEntity(name: name, email: email);

                  context.read<SignUpBloc>().add(
                      OnSubmit(SignUpParams(user: user, password: password)));
                },
                loading: state is SignUpLoading,
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                text: 'Registrarme',
                maxWidth: maxWidth);
          },
        ),
      )
    ]));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
