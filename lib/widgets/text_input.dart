import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(this.label, this.hint, {required this.onSaved, super.key});

  final String label;
  final String hint;
  final ValueChanged<String?> onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(label: Text(label), hintText: hint),
    );
  }
}
