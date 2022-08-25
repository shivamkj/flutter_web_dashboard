import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({this.onSearch, super.key});

  final controller = TextEditingController();
  final Function(String value)? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: .1),
        ),
        hintText: "Search..",
      ),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (onSearch != null) onSearch!(controller.text);
      },
      textInputAction: TextInputAction.search,
    );
  }
}
