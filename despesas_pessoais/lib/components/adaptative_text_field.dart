import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keybordtype;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.controller,
    this.keybordtype = TextInputType.text,
    required this.onSubmitted,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keybordtype,
            onSubmitted: onSubmitted,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            keyboardType: keybordtype,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}
