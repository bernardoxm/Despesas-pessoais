import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(38, 165, 144, 1),
                onPrimary: Colors.white),
            child: Text(label),
          );
  }
}
