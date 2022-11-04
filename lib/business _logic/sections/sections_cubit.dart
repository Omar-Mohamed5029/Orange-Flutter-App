import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/sections/sections_state.dart';
import 'package:orange_ws/data/data_provider/remote/dio_helper.dart';
import '../../../constants/end_points.dart';
import '../../constants/constant_methods.dart';
import '../../data/models/sections/sections_model.dart';

class SectionCubit extends Cubit<SectionsState>{
  SectionCubit() : super(SectionsInitialState());
  static SectionCubit get(context) => BlocProvider.of(context);
  List<SectionsData> data = [];
  Future GetSections(
      {
        token,
        context}
      ) async {
    emit(SectionsLoadingState());

    DioHelper.getData(url: sectionEndPoint,token: token
    ).then((value) async{
      if (value.statusCode == 200){
        SectionsModel sectionsModel=SectionsModel.fromJson(json: value.data) ;
        data = sectionsModel.sectionsDataList;
        // flutterToast(msg:data.length.toString() , color: Colors.green);
        emit(SectionsSuccessState());
        // return data;
      }
    },).catchError((error){
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color:Colors.red);
        print(error.toString());
      }
      emit(SectionsErrorState());
    });
    return data;
  }
}
