import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAutoCompleteTextField extends StatelessWidget {
  final List<String> elements;
  final ThemeData theme;
  final IconData? icon;
  final String? hintText;
  TextEditingController? _controller;

  CustomAutoCompleteTextField(
      {required this.elements,
      required this.theme,
      required this.icon,
      required this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Autocomplete(optionsBuilder: (textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      }

      return elements.where((element) =>
          element.toLowerCase().contains(textEditingValue.text.toLowerCase()));
    }, fieldViewBuilder:
        (context, textEditingController, focusNode, onFieldSubmitted) {
      _controller = textEditingController;

      return CustomTextField(
          controller: textEditingController,
          theme: theme,
          icon: icon,
          hintText: hintText);
    });
  }

  TextEditingController? get controller => _controller;
}
