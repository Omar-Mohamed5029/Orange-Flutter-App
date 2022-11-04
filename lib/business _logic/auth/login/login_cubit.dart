import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/auth/login/login_state.dart';
import 'package:orange_ws/layout/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';

class LogInCubit extends Cubit<LogInState>{
  LogInCubit(): super(LogInInitialState());
  static LogInCubit get(context) => BlocProvider.of(context);
  bool visiblePassword = true;
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }
  Future postlogin  (
      {
        required String email,
        required String password,
        context}) async {
    emit(LogInLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value)async {
      if (value.statusCode == 200) {
        // value.data['data']['accessToken'].toString()
        SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString('token', value.data['data']['accessToken'].toString());
        flutterToast(msg:"LogIn Success" , color: Colors.green);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NavBar()),
              (Route<dynamic> route) => false,);

        emit(LogInSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: "Your Email or Password wrong", color: Colors.red);
        print(error.toString());
      }
      emit(LogInErrorState());
    });


  }
  //
  // savetoken() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString('token', LoginModel);
  // }
}



