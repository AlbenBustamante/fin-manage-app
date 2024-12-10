import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  const NewTransactionForm(
      {super.key,
      required TextEditingController amountController,
      required TextEditingController categoryController,
      required TextEditingController descriptionController,
      required TextEditingController dateController,
      required this.theme,
      required this.maxWidth,
      required this.height,
      required this.onTap})
      : _amountController = amountController,
        _categoryController = categoryController,
        _descriptionController = descriptionController,
        _dateController = dateController;

  final TextEditingController _amountController;
  final TextEditingController _categoryController;
  final TextEditingController _descriptionController;
  final TextEditingController _dateController;
  final ThemeData theme;
  final double height;
  final double maxWidth;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _form(),
        CustomElevatedButton(
            onTap: onTap,
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: Colors.white,
            text: 'Guardar',
            maxWidth: maxWidth,
            loading: false)
      ]),
    );
  }

  Form _form() {
    return Form(
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
    ]));
  }
}
