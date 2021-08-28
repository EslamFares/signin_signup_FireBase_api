import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/companent/signup_button.dart';
import 'companent/form_login.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: h * .2),
            FormLogin(),
            SignUpButton(),
          ],
        ),
      ),
    );
  }
}
