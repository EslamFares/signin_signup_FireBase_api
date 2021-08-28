import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/cubits/cubit.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: LoginCubit.get(context).loadLogin
          ? Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: () {
                if (LoginCubit.get(context)
                    .loginFormKey
                    .currentState!
                    .validate()) {
                  LoginCubit.get(context).login(context);
                }
              },
              child: Text('login'),
            ),
    );
  }
}
