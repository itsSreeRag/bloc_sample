import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controllers;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final int? inputLength;
  const MyTextFormField(
      {super.key,
      required this.controllers,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.prefixIconData,
      this.suffixIconData,
      this.inputLength,
      this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllers,
      keyboardType:
          (keyboardType == null) ? TextInputType.text : keyboardType,
      decoration: InputDecoration(
        prefixIcon: (prefixIconData == null) ? null : Icon(prefixIconData),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
            color: Colors.black54, fontWeight: FontWeight.w500),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $hintText';
        }
        return null;
      },
      autovalidateMode:
          autovalidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(inputLength ?? 20),
      ],
    );
  }
}
