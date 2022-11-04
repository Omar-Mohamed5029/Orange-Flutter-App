
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/university/university_state.dart';
import '../../constants/constant_methods.dart';
import '../../constants/end_points.dart';
import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/university/university_model.dart';

class UniversityCubit extends Cubit<UniversityState>{
  UniversityCubit() : super(UniversityInitialState());
  static UniversityCubit get(context) => BlocProvider.of(context);
  List<UniversityData> data = [];
  Future GetUniversity(
      {
        token,
        context}
      ) async {
    emit(UniversityLoadingState());
    DioHelper.getData(url: universityEndPoint,token: token
    ).then((value) async{
      if (value.statusCode == 200){
        UniversityModel universityModel=UniversityModel.fromJson(json: value.data) ;
        data = universityModel.universityDataList;
        // flutterToast(msg:data.length.toString() , color: Colors.green);
        emit(UniversitySuccessState());
        // return data;
      }
    },).catchError((error){
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color:Colors.red);
        print(error.toString());
      }
      emit(UniversityErrorState());
    });
    return data;
  }
}
