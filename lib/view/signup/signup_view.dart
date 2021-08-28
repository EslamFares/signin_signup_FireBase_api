import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/view/signup/component/go_signin_button.dart';
import 'package:signin_fb_api/view/signup/cubits/cubit.dart';
import 'package:signin_fb_api/view/signup/states/state.dart';
import 'package:signin_fb_api/view/signup/widgets/matchpass_textfield.dart';
import 'package:signin_fb_api/wigdets/email_textfield.dart';
import 'package:signin_fb_api/wigdets/pass_text_field.dart';
import 'component/signup_button.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    SignUpCubit cubit = SignUpCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: w,
            height: h,
            padding: EdgeInsets.all(10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: h * .12),
                Form(
                  key: cubit.signUpFormKey,
                  child: Column(
                    children: [
                      EmailTextField(cubit.emailsignUpController),
                      SizedBox(height: 25),
                      PassTextField(
                          controller: cubit.passwordsignUpontroller,
                          show: cubit.hidePassSignUp,
                          onTabShow: cubit.changeShowPassSignUp),
                      SizedBox(height: 25),
                      MatchPassTextField(),
                      SizedBox(height: 60),
                      SignUPButton(),
                      SizedBox(height: h * .17),
                    ],
                  ),
                ),
                GoSignInButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
