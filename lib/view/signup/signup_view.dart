import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/cubit/home_cubit.dart';
import 'package:signin_fb_api/cubit/home_state.dart';
import 'package:signin_fb_api/view/login_view.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              SizedBox(height: h * .12),
              Form(
                key: cubit.signUpFormKey,
                child: Column(
                  //Email TextFoem Field
                  children: [
                    TextFormField(
                      controller: cubit.emailsignUpController,
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
                        controller: cubit.passwordsignUpontroller,
                        obscureText: cubit.hidePassSignUp,
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
                          contentPadding: EdgeInsets.all(7),
                          prefixIcon: Icon(Icons.lock),
                          suffix: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cubit.changeShowPassSignUp();
                            },
                            icon: cubit.hidePassSignUp
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
                    SizedBox(height: 25),
                    //match pass
                    TextFormField(
                        obscureText: cubit.hidePassSignUp2,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'password is empty!!';
                          } else if (value.toString().length < 6) {
                            return 'minimum digits 6!!';
                          } else if (value.toString() !=
                              cubit.passwordsignUpontroller.text) {
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

                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: cubit.loadSignUp
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                if (cubit.signUpFormKey.currentState!
                                    .validate()) {
                                  print('sign up ===>>>>>');
                                  cubit.signUp(context);
                                }
                              },
                              child: Text('Sign Up'),
                            ),
                    ),
                    SizedBox(height: h * .17),
                  ],
                ),
              ),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

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
