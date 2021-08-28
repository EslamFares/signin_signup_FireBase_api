import 'package:flutter/material.dart';
import 'component/icon_text.dart';
import 'controller/controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
   SplashCubit().initializePreference(context).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconText()),
    );
  }
}
