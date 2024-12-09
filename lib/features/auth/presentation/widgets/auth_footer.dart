import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final ThemeData theme;
  final String text, linkText, route;

  const AuthFooter(
      {required this.theme,
      required this.text,
      required this.linkText,
      required this.route,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: theme.textTheme.bodyMedium,
            text: '$text ',
            children: [
          TextSpan(
              text: linkText,
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, route),
              style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium!.fontSize,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600))
        ]));
  }
}
