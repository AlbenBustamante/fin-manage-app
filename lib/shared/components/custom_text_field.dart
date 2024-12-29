import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ThemeData theme;
  final IconData? icon;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final void Function(String value)? onFieldSubmitted;
  final TextInputType textInputType;
  final TextAlign align;
  final double fontSize;
  final double radius;
  final bool enabled;

  const CustomTextField(
      {required this.controller,
      required this.theme,
      this.focusNode,
      this.onFieldSubmitted,
      this.icon,
      this.enabled = true,
      this.labelText,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.align = TextAlign.left,
      this.fontSize = 18.0,
      this.radius = 15.0,
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
        TextFormField(
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            enabled: enabled,
            keyboardType: textInputType,
            controller: controller,
            textAlign: align,
            style: TextStyle(fontSize: fontSize, color: Colors.grey[900]),
            decoration: _decoration()),
        const SizedBox(height: 24.0)
      ],
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(icon, size: 26.0))
            : null,
        prefixIconColor: Colors.grey.shade700,
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: fontSize),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(radius)));
  }
}
