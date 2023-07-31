import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  const EditText(
      {super.key,
      required this.hint,
      required this.isPassword,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
