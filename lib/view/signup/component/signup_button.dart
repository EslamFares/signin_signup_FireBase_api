import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/signup/cubits/cubit.dart';

class SignUPButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = SignUpCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: cubit.loadSignUp
          ? Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: () {
                if (cubit.signUpFormKey.currentState!.validate()) {
                  print('sign up ===>>>>>');
                  cubit.signUp(context);
                }
              },
              child: Text('Sign Up'),
            ),
    );
  }
}
