import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_fb_api/models/user_model.dart';
import 'package:signin_fb_api/shared/dio_helper.dart';
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
  clearLoginFaild() {
    emailLoginController.clear();
    passwordLoginController.clear();
  }

  bool hidePass = true;
  changeShowPass() {
    hidePass = !hidePass;
    emit(HideLoginPassState());
  }

  //================
  String apiKey = 'AIzaSyDLSy-_xZ7vs4p7s9efCNCcD8FDdIdvG0o';
  bool loadLogin = false;
  UserModel? userModel;
  //============================================
  void login(context) async {
    print('go==========>login');
    loadLogin = true;
    emit(LoadLoginState());

    try {
      var response = await DioHelper.postData(
          url: 'v1/accounts:signInWithPassword?key=$apiKey',
          query: {
            "email": emailLoginController.text,
            "password": passwordLoginController.text,
            "returnSecureToken": true
          });

      //✔️✔️valid state Login
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
        //----------------sahred prefrance --------------
        setUserData();
        //-----------------------------------------------
        emailLoginController.clear();
        passwordLoginController.clear();
      }

      //❌❌invalid state Login
      else {
        print('response.data invaild state ===> ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('❌ ${response.data['error']['message']} ...'),
          behavior: SnackBarBehavior.floating,
        ));
        loadLogin = false;
        emit(LoadLoginState());
      }
    } on Exception catch (e) {
      // ❗❗ invalid state Login Error
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
  clearsignUpFiled() {
    emailsignUpController.clear();
    passwordsignUpontroller.clear();
  }

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
      }
      //❌❌invalid state Sign Up
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('❌  ${response.data['error']['message']} ...'),
          behavior: SnackBarBehavior.floating,
        ));
        loadSignUp = false;
        emit(LoadSignUpState());
      }
    } on Exception catch (e) {
      // ❗❗ invalid state Login Error
      print('errrrrrror===>${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('❗ Email already exists..'),
        behavior: SnackBarBehavior.floating,
      ));
      loadSignUp = false;
      emit(LoadSignUpState());
    }
  }

  //=============shared========
  SharedPreferences? preferences;
  String? emailPref;
  setUserData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString('idToken', userModel!.idToken.toString());
    preferences!.setString('email', userModel!.email.toString());
  }

  getUserData() async {
    preferences = await SharedPreferences.getInstance();
    emailPref = preferences?.getString('email').toString();
    print('emailPref ======>$emailPref');
    emit(GetDataPrefState());
  }

  clearUserData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.clear();
    print('preferences Data clear !!!');
  }
}
