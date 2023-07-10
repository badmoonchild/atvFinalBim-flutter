import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  TextEditingController controller;
  String hintTextName;
  bool enable;
  TextInputType textInputType;
  final Function(String)? onChanged;

  TextInput(
      {super.key,
      required this.controller,
      required this.hintTextName,
      this.textInputType = TextInputType.text,
      this.enable = true,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enable,
      decoration: InputDecoration(
        labelText: hintTextName,
        hintText: hintTextName,
        border: const OutlineInputBorder(),
      ),
      keyboardType: textInputType,
      onChanged: onChanged,
    );
  }
}
