import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_fb_api/cubit/home_cubit.dart';
import 'package:signin_fb_api/view/login_view.dart';
import 'widgets/ios_show_dialog.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeCubit cubit = HomeCubit.get(context);
    // cubit.getUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                iosShowDialog(
                    context: context,
                    title: 'Log Out',
                    subTitle: 'Are you sure??',
                    onConfirm: () {
                      cubit.clearUserData();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    addFunRefuse: () {});
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        width: w,
        height: h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * .08),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 20),
            Text(
                '${cubit.emailPref != null ? '${cubit.emailPref}' : '${cubit.userModel?.email}'}'),
            SizedBox(height: 20),
            // Text('${cubit.userModel.expiresIn}')
          ],
        ),
      ),
    );
  }
}
