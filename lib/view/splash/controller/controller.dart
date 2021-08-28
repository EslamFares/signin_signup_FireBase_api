import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_fb_api/view/home/cubits/cubit.dart';
import 'package:signin_fb_api/view/home/home_view.dart';
import 'package:signin_fb_api/view/login/login_view.dart';

class SplashCubit {
  SharedPreferences? preferences;
  Future<void> initializePreference(context) async {
    this.preferences = await SharedPreferences.getInstance();
    bool _login = this.preferences!.getString('email') != null ? true : false;
    Timer(Duration(seconds: 2), () {
      print('login ==> $_login email :${this.preferences!.getString('email')}');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => _login ? HomeView() : LoginView()));
      _login
          ? HomeCubit.get(context).getUserData()
          : print('dont get shared data');
    });
  }
}
