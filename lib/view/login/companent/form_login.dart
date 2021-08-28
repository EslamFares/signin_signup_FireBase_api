import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/login/cubits/cubit.dart';
import 'package:signin_fb_api/view/login/widgets/forget_password_button.dart';
import 'package:signin_fb_api/view/login/widgets/login_button.dart';
import 'package:signin_fb_api/wigdets/pass_text_field.dart';
import 'package:signin_fb_api/wigdets/email_textfield.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    LoginCubit cubit = LoginCubit.get(context);
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        children: [
          EmailTextField(cubit.emailLoginController),
          // EmailTextField(),
          SizedBox(height: 25),
          PassTextField(
              controller: cubit.passwordLoginController,
              show: cubit.hidePass,
              onTabShow: cubit.changeShowPass),
          SizedBox(height: 10),
          ForgetPasswordButton(),
          SizedBox(height: 50),
          LoginButton(),
          SizedBox(height: h * .15),
        ],
      ),
    );
  }
}
