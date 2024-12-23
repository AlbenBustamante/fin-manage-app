import 'package:finmanageapp/features/auth/presentation/pages/sign_in_page.dart';
import 'package:finmanageapp/features/home/presentation/blocs/config_bloc/config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigPage extends StatelessWidget {
  static const route = '/config';

  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Configuración')),
        body: BlocListener<ConfigBloc, ConfigState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                Navigator.popAndPushNamed(context, SignInPage.route);
              }
            },
            child: _view(context, size)));
  }

  Padding _view(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(children: [
                const Divider(),
                ListTile(
                    leading: Icon(Icons.power_off,
                        color: Colors.grey[800], size: 28.0),
                    title: Text('Cerrar sesión',
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 20.0)),
                    onTap: () {
                      context.read<ConfigBloc>().add(SignOut());
                    })
              ])
            ]),
      ),
    );
  }
}
