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
            showDialog(context: context, builder: (context) => _dialog());
          },
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_outlined, size: 40.0)),
    );
  }

  SimpleDialog _dialog() {
    return SimpleDialog(
        title: Text('¿Qué quieres agregar?', style: theme.textTheme.titleLarge),
        children: [
          _option('Nuevo gasto', () {}),
          const SizedBox(height: 5.0),
          _option('Nuevo ingreso', () {})
        ]);
  }

  SimpleDialogOption _option(String text, void Function() onTap) {
    return SimpleDialogOption(
        onPressed: () => onTap(),
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
        child: Text(text,
            style: TextStyle(fontSize: 20.0, color: Colors.grey[700])));
  }
}
