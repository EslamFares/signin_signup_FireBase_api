import 'package:flutter/material.dart';
import 'package:signin_fb_api/view/home/cubits/cubit.dart';
import 'package:signin_fb_api/view/home/widgets/ios_show_dialog.dart';
import 'package:signin_fb_api/view/login/login_view.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return IconButton(
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
        icon: Icon(Icons.logout));
  }
}
