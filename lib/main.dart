import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/view/home/cubits/cubit.dart';
import 'package:signin_fb_api/view/login/cubits/cubit.dart';
import 'package:signin_fb_api/view/login/states/state.dart';
import 'package:signin_fb_api/view/signup/cubits/cubit.dart';
import 'package:signin_fb_api/view/splash/splash.dart';
import 'core/bloc_observer.dart';
import 'core/dark_theme.dart';
import 'core/dio_helper.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: darkTheme(),
          home: SplashView(),
        ),
      ),
    );
  }
}
