import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/shared/components/custom_auto_complete_text_field.dart';
import 'package:finmanageapp/shared/components/custom_elevated_button.dart';
import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  final ThemeData theme;
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;
  final void Function(CreateTransactionParams params) callback;
  final bool loading;
  final double maxWidth;

  const NewTransactionForm({
    required this.theme,
    required this.categories,
    required this.descriptions,
    required this.callback,
    required this.loading,
    required this.maxWidth,
    super.key,
  });

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  var _selectedDate = DateTime.now();

  static const _format = "EEE, dd MMM, ''yy";

  @override
  void initState() {
    _dateController.text = DateFormat(_format).format(_selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
            child: Column(children: [
          CustomTextField(
              textInputType: TextInputType.number,
              controller: _amountController,
              theme: widget.theme,
              align: TextAlign.center,
              hintText: '0',
              fontSize: 30.0,
              radius: 45.0),
          const SizedBox(height: 12.0),
          CustomAutoCompleteTextField(
              controller: _categoryController,
              elements:
                  widget.categories.map((category) => category.name).toList(),
              theme: widget.theme,
              icon: Icons.category_outlined,
              hintText: 'Categoría'),
          CustomAutoCompleteTextField(
              controller: _descriptionController,
              elements: widget.descriptions
                  .map((description) => description.text)
                  .toList(),
              theme: widget.theme,
              icon: Icons.note_alt_outlined,
              hintText: 'Descripción'),
          GestureDetector(
            onTap: () async {
              await _onDateTap(context);
            },
            child: CustomTextField(
                enabled: false,
                textInputType: TextInputType.datetime,
                controller: _dateController,
                theme: widget.theme,
                icon: Icons.date_range_outlined,
                hintText: 'Fecha'),
          )
        ])),
        CustomElevatedButton(
            onTap: _onTap,
            backgroundColor: widget.theme.colorScheme.primary,
            foregroundColor: Colors.white,
            text: 'Guardar',
            maxWidth: widget.maxWidth,
            loading: widget.loading)
      ],
    );
  }

  Future<void> _onDateTap(BuildContext context) async {
    final datePicked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2024, 12),
        lastDate: _selectedDate);

    if (datePicked != null && datePicked != _selectedDate) {
      setState(() {
        _selectedDate = datePicked;
        _dateController.text = DateFormat(_format).format(_selectedDate);
      });
    }
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
        date: _selectedDate);

    widget.callback(params);
  }
}
