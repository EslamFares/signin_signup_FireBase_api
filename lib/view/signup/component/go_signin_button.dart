import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/login_view.dart';

class GoSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("have acount? "),
        TextButton(
            onPressed: () {
              print('have acount?');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginView()));
            },
            child: Text("Sign IN"))
      ],
    );
  }
}
