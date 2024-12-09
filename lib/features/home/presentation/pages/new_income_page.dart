import 'package:flutter/material.dart';

class NewIncomePage extends StatelessWidget {
  static const route = '/new-income';

  const NewIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Nuevo ingreso')));
  }
}
