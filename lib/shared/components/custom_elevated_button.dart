import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final double maxWidth;
  final bool loading;

  const CustomElevatedButton(
      {required this.onTap,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.text,
      required this.maxWidth,
      required this.loading,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: loading ? null : onTap,
        style: _style(),
        child: loading
            ? const CircularProgressIndicator()
            : Text(text, style: _textStyle()));
  }

  TextStyle _textStyle() {
    return TextStyle(
        color: foregroundColor, fontWeight: FontWeight.w500, fontSize: 18.0);
  }

  ButtonStyle _style() {
    return ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(maxWidth, 50.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        elevation: 0.5);
  }
}
