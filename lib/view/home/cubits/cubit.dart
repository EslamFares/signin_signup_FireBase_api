import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_fb_api/view/home/states/state.dart';
import 'package:signin_fb_api/view/login/models/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInit());
  static HomeCubit get(context) => BlocProvider.of(context);

//=============shared========
  SharedPreferences? preferences;
  String? emailPref;
 Future<void> setUserData(UserModel? userModel) async {
    preferences = await SharedPreferences.getInstance();
    preferences!
        .setString('idToken', userModel!.idToken.toString());
    preferences!.setString('email', userModel.email.toString());
  }

 Future<void> getUserData() async {
    preferences = await SharedPreferences.getInstance();
    emailPref = preferences?.getString('email').toString();
    print('emailPref ======>$emailPref');
    emit(GetDataPrefState());
  }

 Future<void> clearUserData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.clear();
    print('preferences Data clear !!!');
  }
}
