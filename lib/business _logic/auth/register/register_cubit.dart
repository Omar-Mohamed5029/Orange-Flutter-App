
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/auth/register/register_state.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';
import '../../../layout/navbar.dart';



class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = true;
  bool visibleConfirmPassword = true;



  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility
  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  String gender = 'm';
  void changeGender(value){
    gender = value;
    emit(ChangeGenderState());
  }

  Future postRegister(
      {required String name,
        required String email,
        required String password,
        required String phoneNumber,
        required String gender,
        required context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) {
      if (value.statusCode == 200) {

        flutterToast(msg: 'Registered Successfully', color: Colors.green);
        Navigator.pushNamed(context, 'login');
        emit(RegisterSuccessState());
      }
      // print(value);
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}
