import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/consts/const.dart';
import 'package:signin_fb_api/core/dio_helper.dart';
import 'package:signin_fb_api/view/login/login_view.dart';
import 'package:signin_fb_api/view/signup/states/state.dart';
import 'package:signin_fb_api/wigdets/snackbar_alert.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  //================SignUp====================
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailsignUpController = TextEditingController();
  TextEditingController passwordsignUpontroller = TextEditingController();
  //==================

  bool hidePassSignUp = true;
  void changeShowPassSignUp() {
    hidePassSignUp = !hidePassSignUp;
    emit(HideSignUpPassState());
  }

  bool hidePassSignUp2 = true;
  void changeShowPassSignUp2() {
    hidePassSignUp2 = !hidePassSignUp2;
    emit(HideSignUpPassState());
  }

  //===================
  bool loadSignUp = false;

  Future<void> signUp(context) async {
    print('go==========>SignUp');
    loadSignUp = true;
    emit(LoadSignUpState());

    try {
      var response = await DioHelper.postData(
          url: 'v1/accounts:signUp?key=$apiKey',
          query: {
            "email": emailsignUpController.text,
            "password": passwordsignUpontroller.text,
            "returnSecureToken": true
          });
      //✔️✔️ valid state Sign Up

      if (response.statusCode == 200) {
        print('data send >>>>>> ${response.statusCode}');
        snackBarAlert(context, '✔️ account created ..❗ Now LoginIn ..');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView()));
        loadSignUp = false;
        emit(LoadSignUpState());
        emailsignUpController.clear();
        passwordsignUpontroller.clear();
      }
      //❌❌invalid state Sign Up
      else {
        snackBarAlert(context, '❌  ${response.data['error']['message']} ...');

        loadSignUp = false;
        emit(LoadSignUpState());
      }
    } on Exception catch (e) {
      // ❗❗ invalid state Login Error
      print('errrrrrror===>${e.toString()}');
      snackBarAlert(context, '❗ Email already exists..');

      loadSignUp = false;
      emit(LoadSignUpState());
    }
  }
}
