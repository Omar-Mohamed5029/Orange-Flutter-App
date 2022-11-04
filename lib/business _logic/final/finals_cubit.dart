import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constant_methods.dart';
import '../../constants/end_points.dart';
import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/final/fianls_model.dart';
import 'final_state.dart';

class FinalCubit extends Cubit<FinalState>{
  FinalCubit() : super(FinalInitialState());
  static FinalCubit get(context) => BlocProvider.of(context);
  List<FinalsData> data = [];
  Future GetExams(
      {
        token,
        context}
      ) async {
    emit(FinalLoadingState());

    DioHelper.getData(url: 'exams',token: token
    ).then((value) async{
      if (value.statusCode == 200){
        if(value.data == null){
          flutterToast(msg: "no Data", color: Colors.green);
        }else {
          FinalModel finalModel = FinalModel.fromJson(json: value.data);
          data = finalModel.finalsDataList;
          flutterToast(msg: data.length.toString(), color: Colors.green);
          // print(data);
          emit(FinalSuccessState());

        }
        // return data;
      }
    },).catchError((error){
      if (kDebugMode) {
        // flutterToast(msg: error.toString(), color:Colors.red);
        print(error.toString());
      }
      emit(FinalErrorState());
    });
    if(data.isNotEmpty)
      return data;

  }
}
