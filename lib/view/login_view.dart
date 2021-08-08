import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/cubit/home_cubit.dart';
import 'package:signin_fb_api/cubit/home_state.dart';
import 'package:signin_fb_api/view/signup/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => Container(
          width: w,
          height: h,
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: h * .2),
              Form(
                key: HomeCubit.get(context).loginFormKey,
                child: Column(
                  //Email TextFoem Field
                  children: [
                    TextFormField(
                      controller: HomeCubit.get(context).emailLoginController,
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
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                      ),
                    ),
                    SizedBox(height: 25),
                    //Pass TextFoem Field
                    TextFormField(
                        controller: HomeCubit.get(context).passwordLoginController,
                        obscureText: HomeCubit.get(context).hidePass,
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
                              HomeCubit.get(context).changeShowPass();
                            },
                            icon: HomeCubit.get(context).hidePass
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          labelText: 'password',
                          hintText: '**************',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 2)),
                        )),
                    SizedBox(height: 10),
                    ForgetPasswordButton(),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: HomeCubit.get(context).loadLogin
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
      onPressed: () {
        if (HomeCubit.get(context).loginFormKey.currentState!.validate()) {
          HomeCubit.get(context).login(context);
        }
      },
      child: Text('login'),
    ),
                    ),
                    SizedBox(height: h * .2),
                  ],
                ),
              ),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

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


class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              print('forget password');
            },
            child: Text('forget password'))
      ],
    );
  }
}
