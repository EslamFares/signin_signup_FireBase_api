import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:signin_fb_api/models/user_model.dart';
import 'package:signin_fb_api/view/home/home_view.dart';
import 'package:signin_fb_api/view/login_view.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
//========================
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  bool hidePass = true;
  changeShowPass() {
    hidePass = !hidePass;
    emit(HideLoginPassState());
  }

  //================
  String apiKey = 'AIzaSyDLSy-_xZ7vs4p7s9efCNCcD8FDdIdvG0o';
  bool loadLogin = false;
  late UserModel userModel;
  void login(context) async {
    print('go==========>login');
    loadLogin = true;
    emit(LoadLoginState());

    try {
      var response = await Dio().post(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey',
          data: {
            "email": emailLoginController.text,
            "password": passwordLoginController.text,
            "returnSecureToken": true
          });

      //invalid state
      if (response.statusCode == 200) {
        print('data come >>>>>> ${response.statusCode}');
        userModel = UserModel.fromJson(response.data);
        emit(UserLoginDataComeState());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        loadLogin = false;
        emit(LoadLoginState());
        emailLoginController.clear();
        passwordLoginController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('❌ INVALID Email or PASSWORD...'),
          behavior: SnackBarBehavior.floating,
        ));
        loadLogin = false;
        emit(LoadLoginState());
      }
    } on Exception catch (e) {
      //invalid state
      print('errrrrrror===>${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('❌ INVALID Email or PASSWORD...'),
        behavior: SnackBarBehavior.floating,
      ));
      loadLogin = false;
      emit(LoadLoginState());
    }
  }
  //================SignUp====================
 final signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailsignUpController = TextEditingController();
  TextEditingController passwordsignUpontroller = TextEditingController();
  //==================
  bool hidePassSignUp = true;
  changeShowPassSignUp() {
    hidePassSignUp = !hidePassSignUp;
    emit(HideSignUpPassState());
  }
  bool hidePassSignUp2 = true;
  changeShowPassSignUp2() {
    hidePassSignUp2 = !hidePassSignUp2;
    emit(HideSignUpPassState());
  }
  //===================
  bool loadSignUp = false;
 
  void signUp(context) async {
    print('go==========>SignUp');
    loadSignUp = true;
    emit(LoadSignUpState());

    try {
      var response = await Dio().post(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey',
          data: {
            "email": emailsignUpController.text,
            "password": passwordsignUpontroller.text,
            "returnSecureToken": true
          });

      //invalid state
      if (response.statusCode == 200) {
        print('data send >>>>>> ${response.statusCode}');
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('✔️ account created ..❗ Now LoginIn ..'),
          behavior: SnackBarBehavior.floating,
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
        );
        loadSignUp = false;
        emit(LoadSignUpState());
        emailsignUpController.clear();
        passwordsignUpontroller.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('❌ Email already exists..'),
          behavior: SnackBarBehavior.floating,
        ));
        loadSignUp = false;
        emit(LoadSignUpState());
      }
    } on Exception catch (e) {
      //invalid state
      print('errrrrrror===>${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('❌ Email already exists..'),
        behavior: SnackBarBehavior.floating,
      ));
      loadSignUp = false;
      emit(LoadSignUpState());
    }
  }

}
