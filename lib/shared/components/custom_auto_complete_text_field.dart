import 'package:finmanageapp/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAutoCompleteTextField extends StatelessWidget {
  final List<String> elements;
  final FocusNode focusNode;
  final ThemeData theme;
  final IconData? icon;
  final String? hintText;
  final TextEditingController controller;

  const CustomAutoCompleteTextField(
      {required this.elements,
      required this.focusNode,
      required this.theme,
      required this.icon,
      required this.hintText,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
        textEditingController: controller,
        focusNode: focusNode,
        optionsBuilder: (textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }

          return elements.where((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase().trim()));
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  elevation: 4.0,
                  child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: elements.length,
                        itemBuilder: (context, index) {
                          final option = elements[index];
                          return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(title: Text(option)));
                        }),
                  )),
            ),
          );
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return CustomTextField(
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              controller: textEditingController,
              theme: theme,
              icon: icon,
              hintText: hintText);
        });
  }
}
