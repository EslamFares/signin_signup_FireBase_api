import 'package:flutter/material.dart';

void snackBarAlert(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  ));
}
