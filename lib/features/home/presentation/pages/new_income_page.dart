import 'package:finmanageapp/features/home/presentation/widgets/new_transaction_form.dart';
import 'package:flutter/material.dart';

class NewIncomePage extends StatelessWidget {
  static const route = '/new-income';

  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  NewIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Nuevo ingreso')),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: NewTransactionForm(
                    amountController: _amountController,
                    categoryController: _categoryController,
                    descriptionController: _descriptionController,
                    dateController: _dateController,
                    theme: theme,
                    maxWidth: size.width - 50.0,
                    height: size.height - 160.0,
                    onTap: () {}))));
  }
}
