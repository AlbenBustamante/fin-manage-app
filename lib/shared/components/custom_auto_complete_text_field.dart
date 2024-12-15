import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAutoCompleteTextField extends StatelessWidget {
  final List<String> elements;
  final ThemeData theme;
  final IconData? icon;
  final String? hintText;
  final TextEditingController controller;

  const CustomAutoCompleteTextField(
      {required this.elements,
      required this.theme,
      required this.icon,
      required this.hintText,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
        textEditingController: controller,
        focusNode: FocusNode(),
        optionsBuilder: (textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }

          return elements.where((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Material(
              elevation: 4.0,
              child: ListView.builder(
                  itemCount: elements.length,
                  itemBuilder: (context, index) {
                    final option = elements[index];
                    return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(title: Text(option)));
                  }));
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return CustomTextField(
              controller: textEditingController,
              theme: theme,
              icon: icon,
              hintText: hintText);
        });
  }
}
