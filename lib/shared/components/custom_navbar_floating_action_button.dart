import 'package:finmanageapp/features/home/presentation/pages/new_expense_page.dart';
import 'package:finmanageapp/features/home/presentation/pages/new_income_page.dart';
import 'package:flutter/material.dart';

class CustomNavbarFloatingActionButton extends StatelessWidget {
  final ThemeData theme;

  const CustomNavbarFloatingActionButton({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(color: Colors.white, blurRadius: 1.0, spreadRadius: 7.0)
      ]),
      child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context, builder: (context) => _dialog(context));
          },
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_outlined, size: 40.0)),
    );
  }

  SimpleDialog _dialog(BuildContext context) {
    return SimpleDialog(
        title: Text('¿Qué quieres agregar?', style: theme.textTheme.titleLarge),
        children: [
          _option(context, 'Nuevo gasto', NewExpensePage.route),
          const SizedBox(height: 5.0),
          _option(context, 'Nuevo ingreso', NewIncomePage.route)
        ]);
  }

  SimpleDialogOption _option(BuildContext context, String text, String route) {
    return SimpleDialogOption(
        onPressed: () => Navigator.popAndPushNamed(context, route),
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
        child: Text(text,
            style: TextStyle(fontSize: 20.0, color: Colors.grey[700])));
  }
}
