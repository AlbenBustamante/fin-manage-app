import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

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
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 160.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                      child: Column(children: [
                    CustomTextField(
                        controller: _amountController,
                        theme: theme,
                        align: TextAlign.center,
                        hintText: '0',
                        fontSize: 30.0,
                        radius: 45.0),
                    const SizedBox(height: 24.0),
                    CustomTextField(
                        controller: _categoryController,
                        theme: theme,
                        icon: Icons.category_outlined,
                        hintText: 'Categoría'),
                    CustomTextField(
                        controller: _descriptionController,
                        theme: theme,
                        icon: Icons.note_alt_outlined,
                        hintText: 'Descripción'),
                    CustomTextField(
                        controller: _dateController,
                        theme: theme,
                        icon: Icons.date_range_outlined,
                        hintText: 'Fecha')
                  ])),
                  CustomElevatedButton(
                      onTap: () {},
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      text: 'Guardar',
                      maxWidth: maxWidth,
                      loading: false)
                ]),
          ),
        )));
  }
}
