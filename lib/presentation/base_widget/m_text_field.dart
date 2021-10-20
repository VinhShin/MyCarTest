import 'package:flutter/material.dart';

class MTextField extends TextField {
  MTextField(
      {String? hint, ValueChanged<String>? onChanged, bool obscureText = false})
      : super(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!)),
                border: OutlineInputBorder(),
                hintText: hint));
}
