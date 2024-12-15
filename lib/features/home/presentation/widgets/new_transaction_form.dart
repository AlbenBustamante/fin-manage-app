import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/shared/components/custom_auto_complete_text_field.dart';
import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController dateController;
  final ThemeData theme;
  final double height;
  final double maxWidth;
  final void Function() onTap;
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;
  TextEditingController? _categoryController;
  TextEditingController? _descriptionController;

  NewTransactionForm(
      {super.key,
      required this.amountController,
      required this.dateController,
      required this.theme,
      required this.maxWidth,
      required this.height,
      required this.onTap,
      required this.categories,
      required this.descriptions});

  @override
  Widget build(BuildContext context) {
    final categoryTextField = CustomAutoCompleteTextField(
        elements: categories.map((category) => category.name).toList(),
        theme: theme,
        icon: Icons.category_outlined,
        hintText: 'Categoría');

    _categoryController = categoryTextField.controller;

    final descriptionTextField = CustomAutoCompleteTextField(
        elements: descriptions.map((description) => description.text).toList(),
        theme: theme,
        icon: Icons.note_alt_outlined,
        hintText: 'Descripción');

    _descriptionController = descriptionTextField.controller;

    return SizedBox(
      height: height,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _form(categoryTextField, descriptionTextField),
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

  Form _form(Widget categoryTextField, Widget descriptionTextField) {
    return Form(
        child: Column(children: [
      CustomTextField(
          controller: amountController,
          theme: theme,
          align: TextAlign.center,
          hintText: '0',
          fontSize: 30.0,
          radius: 45.0),
      categoryTextField,
      descriptionTextField,
      CustomTextField(
          controller: dateController,
          theme: theme,
          icon: Icons.date_range_outlined,
          hintText: 'Fecha')
    ]));
  }

  TextEditingController? get categoryControler => _categoryController;
  TextEditingController? get descriptionController => _descriptionController;
}
