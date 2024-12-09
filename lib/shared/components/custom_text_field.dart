import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ThemeData theme;
  String? labelText;
  final IconData icon;
  String? hintText;

  CustomTextField(
      {required this.controller,
      required this.theme,
      this.labelText,
      required this.icon,
      this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: labelText != null,
            child: Text(labelText ?? '', style: theme.textTheme.labelMedium)),
        const SizedBox(height: 5.0),
        TextFormField(controller: controller, decoration: _decoration()),
        const SizedBox(height: 24.0)
      ],
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(icon)),
        prefixIconColor: Colors.grey.shade700,
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15.0)));
  }
}
