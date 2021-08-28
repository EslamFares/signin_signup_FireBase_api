import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:signin_fb_api/consts/const.dart';
import 'package:signin_fb_api/core/dio_helper.dart';
import 'package:signin_fb_api/view/home/cubits/cubit.dart';
import 'package:signin_fb_api/view/login/models/user_model.dart';
import 'package:signin_fb_api/view/home/home_view.dart';
import 'package:signin_fb_api/wigdets/snackbar_alert.dart';

import '../states/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
//========================
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  bool hidePass = true;
 void changeShowPass() {
    hidePass = !hidePass;
    emit(HideLoginPassState());
  }

  //================

  bool loadLogin = false;
  UserModel? userModel;
  //============================================
  Future<void> login(context) async {
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
            context, MaterialPageRoute(builder: (context) => HomeView()));

        loadLogin = false;
        emit(LoadLoginState());
        //----------------sahred prefrance --------------
        HomeCubit().setUserData(userModel);
        //-----------------------------------------------
        emailLoginController.clear();
        passwordLoginController.clear();
      }
      //❌❌invalid state Login
      else {
        print('response.data invaild state ===> ${response.data}');
        snackBarAlert(context, '❌ ${response.data['error']['message']} ...');
        loadLogin = false;
        emit(LoadLoginState());
      }
    } on Exception catch (e) {
      // ❗❗ invalid state Login Error
      print('errrrrrror===>${e.toString()}');
      snackBarAlert(context, '❌ INVALID Email or PASSWORD...');
      loadLogin = false;
      emit(LoadLoginState());
    }
  }
}
