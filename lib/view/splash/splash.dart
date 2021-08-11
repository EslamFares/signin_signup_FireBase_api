import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_fb_api/cubit/home_cubit.dart';
import 'package:signin_fb_api/view/home/home_view.dart';
import 'package:signin_fb_api/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SharedPreferences? preferences;
  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {});
  }

  Future<void> initializePreference() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 100,
            color: Colors.pink,
          ),
          Text(
            'welcome...',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
