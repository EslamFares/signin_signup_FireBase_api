import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/signup/signup_view.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("don't have a count? "),
        TextButton(
            onPressed: () {
              print('create account');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUpView()),
              );
            },
            child: Text("Sign Up "))
      ],
    );
  }
}
