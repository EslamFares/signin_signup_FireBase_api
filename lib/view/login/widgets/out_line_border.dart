import 'package:flutter/material.dart';

OutlineInputBorder outLineBorder({Color? color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color??Colors.blueAccent, width: 2));
}
