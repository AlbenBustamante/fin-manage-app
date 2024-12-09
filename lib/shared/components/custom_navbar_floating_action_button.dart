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
          onPressed: () {},
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_outlined, size: 40.0)),
    );
  }
}
