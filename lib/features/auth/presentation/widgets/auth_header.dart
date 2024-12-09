import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final ThemeData theme;
  final String title, subtitle;

  const AuthHeader(
      {required this.theme,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130.0,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4.0),
            Text(subtitle, style: theme.textTheme.titleMedium)
          ],
        ));
  }
}
