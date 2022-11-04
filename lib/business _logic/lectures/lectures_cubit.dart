import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/lectures/lectures_state.dart';
import 'package:orange_ws/data/data_provider/remote/dio_helper.dart';
import 'package:orange_ws/data/models/lectures/lectures_model.dart';
import '../../../constants/end_points.dart';
import '../../constants/constant_methods.dart';

class LecturesCubit extends Cubit<LecturesState>{
  LecturesCubit() : super(LecturesInitialState());
  static LecturesCubit get(context) => BlocProvider.of(context);
   List<LecturesData> data = [];
  Future GetLectures(
  {
     token,
     context}
  ) async {
    emit(LecturesLoadingState());
    DioHelper.getData(url: lectureEndPoint,token: token
    ).then((value) async{
      if (value.statusCode == 200){
        LecturesModel lecturesModel=LecturesModel.fromJson(json: value.data) ;
        data = lecturesModel.lecturesDataList;
        // flutterToast(msg:data.length.toString() , color: Colors.green);
        emit(LecturesSuccessState());
        // return data;
      }
    },).catchError((error){
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color:Colors.red);
        print(error.toString());
      }
      emit(LecturesErrorState());
    });
    return data;
  }
}
