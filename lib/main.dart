import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_fb_api/cubit/home_cubit.dart';
import 'package:signin_fb_api/cubit/home_state.dart';
import 'package:signin_fb_api/shared/dio_helper.dart';
import 'shared/bloc_observer.dart';
import 'shared/dark_theme.dart';
import 'view/login_view.dart';

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
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: darkTheme(), // ThemeData(primarySwatch: Colors.blue),
          home: LoginView(),
        ),
      ),
    );
  }
}
