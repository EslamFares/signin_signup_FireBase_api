import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/widgets/out_line_border.dart';
import 'package:signin_fb_api/view/signup/cubits/cubit.dart';

class MatchPassTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = SignUpCubit.get(context);
    return TextFormField(
        obscureText: cubit.hidePassSignUp2,
        validator: (value) {
          if (value.toString().isEmpty) {
            return 'password is empty!!';
          } else if (value.toString().length < 6) {
            return 'minimum digits 6!!';
          } else if (value.toString() != cubit.passwordsignUpontroller.text) {
            return 'pass dont matched';
          } else
            return null;
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(Icons.done_all),
          suffix: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              cubit.changeShowPassSignUp2();
            },
            icon: cubit.hidePassSignUp2
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
          labelText: 'password again',
          hintText: '**************',
          enabledBorder: outLineBorder(color: Colors.blueGrey),
          errorBorder: outLineBorder(color: Colors.red),
          focusedBorder: outLineBorder(),
          disabledBorder: outLineBorder(),
          focusedErrorBorder: outLineBorder(),
        ));
  }
}
