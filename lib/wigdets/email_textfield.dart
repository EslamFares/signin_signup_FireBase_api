import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/widgets/out_line_border.dart';

class EmailTextField extends StatelessWidget {
 final TextEditingController controller;

  const EmailTextField(this.controller);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'email is empty!!';
        }
        if (value.toString().length < 7) {
          return 'minimum digits 7!!';
        } else
          return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'eslam@gmail.com',
        labelText: 'email',
        enabledBorder: outLineBorder(color: Colors.blueGrey),
        errorBorder: outLineBorder(color: Colors.red),
        focusedBorder: outLineBorder(),
        disabledBorder: outLineBorder(),
        focusedErrorBorder: outLineBorder(),
      ),
    );
  }
}