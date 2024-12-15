import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/shared/components/custom_auto_complete_text_field.dart';
import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final ThemeData theme;
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;
  final void Function(CreateTransactionParams params) callback;
  final bool loading;
  final double maxWidth;

  NewTransactionForm({
    required this.theme,
    required this.categories,
    required this.descriptions,
    required this.callback,
    required this.loading,
    required this.maxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          CustomAutoCompleteTextField(
              controller: _categoryController,
              elements: categories.map((category) => category.name).toList(),
              theme: theme,
              icon: Icons.category_outlined,
              hintText: 'Categoría'),
          CustomAutoCompleteTextField(
              controller: _descriptionController,
              elements:
                  descriptions.map((description) => description.text).toList(),
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
            onTap: _onTap,
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: Colors.white,
            text: 'Guardar',
            maxWidth: maxWidth,
            loading: loading)
      ],
    );
  }

  void _onTap() {
    final category = _categoryController.text.trim();
    final description = _descriptionController.text.trim();

    final params = CreateTransactionParams(
        category: category,
        description: description,
        categoryId: null,
        descriptionId: null,
        value: int.parse(_amountController.text),
        date: DateTime.now());

    callback(params);
  }
}
