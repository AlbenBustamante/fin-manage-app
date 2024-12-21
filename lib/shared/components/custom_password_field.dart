import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final ThemeData theme;
  final String labelText;

  const CustomPasswordField(
      {required this.controller,
      required this.theme,
      required this.labelText,
      super.key});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: widget.theme.textTheme.labelMedium),
        const SizedBox(height: 5.0),
        TextFormField(
            controller: widget.controller,
            obscureText: !_showPassword,
            decoration: _decoration(),
            style: TextStyle(fontSize: 18.0, color: Colors.grey[900])),
        const SizedBox(height: 24.0)
      ],
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
        prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(Icons.lock_outlined, size: 26.0)),
        prefixIconColor: Colors.grey.shade700,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: IconButton(
              icon: Icon(
                  _showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 26.0),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              }),
        ),
        suffixIconColor: Colors.grey.shade700,
        hintText: '********',
        hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.theme.colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15.0)));
  }
}
