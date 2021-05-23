import 'dart:core';

import 'package:flutter/material.dart';

//custom textfield for task 3
class CustomTextField extends StatelessWidget {
  String label;
  String hint;
  TextEditingController textEditingController;
  CustomTextField({
    required this.label,
    required this.hint,
    required this.textEditingController,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
