import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/widgets/out_line_border.dart';

class PassTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool show;
  final Function onTabShow;

  const PassTextField(
      {required this.controller, required this.show, required this.onTabShow});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: show,
        validator: (value) {
          if (value.toString().isEmpty) {
            return 'password is empty!!';
          }
          if (value.toString().length < 6) {
            return 'minimum digits 6!!';
          } else
            return null;
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          prefixIcon: Icon(Icons.lock),
          suffix: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              onTabShow();
            },
            icon: show ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          ),
          labelText: 'password',
          hintText: '**************',
          enabledBorder: outLineBorder(color: Colors.blueGrey),
          errorBorder: outLineBorder(color: Colors.red),
          focusedBorder: outLineBorder(),
          disabledBorder: outLineBorder(),
          focusedErrorBorder: outLineBorder(),
        ));
  }
}
