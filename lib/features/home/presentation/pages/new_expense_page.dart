import 'package:flutter/material.dart';

import '../widgets/new_transaction_form.dart';

class NewExpensePage extends StatelessWidget {
  static const route = '/new-expense';

  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  NewExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width - 50.0;

    return Scaffold(
        appBar: AppBar(title: const Text('Nuevo gasto')),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          child: NewTransactionForm(
              amountController: _amountController,
              categoryController: _categoryController,
              descriptionController: _descriptionController,
              dateController: _dateController,
              theme: theme,
              height: MediaQuery.sizeOf(context).height - 160.0,
              maxWidth: maxWidth,
              onTap: () {}),
        )));
  }
}
