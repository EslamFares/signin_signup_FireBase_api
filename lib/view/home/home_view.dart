import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/home/componant/LogOutButton.dart';
import 'package:signin_fb_api/view/home/cubits/cubit.dart';
import 'package:signin_fb_api/view/home/widgets/pofile_img.dart';
import 'package:signin_fb_api/view/login/cubits/cubit.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    LoginCubit cubit = LoginCubit.get(context);
    HomeCubit homeCubit = HomeCubit.get(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [LogOutButton()],
      ),
      body: Container(
        width: w,
        height: h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * .08),
            PofileImg(),
            SizedBox(height: 20),
            Text(
                '${homeCubit.emailPref != null ? '${homeCubit.emailPref}' : '${cubit.userModel?.email}'}'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
