import 'package:flutter/material.dart';

class NewExpensePage extends StatelessWidget {
  static const route = '/new-expense';

  const NewExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Nuevo gasto')));
  }
}
