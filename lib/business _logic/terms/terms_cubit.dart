import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/business%20_logic/terms/terms_state.dart';
import 'package:orange_ws/data/data_provider/remote/dio_helper.dart';
import '../../../constants/end_points.dart';
import '../../constants/constant_methods.dart';
import '../../data/models/terms/terms_model.dart';

class TermsCubit extends Cubit<TermsState>{
  TermsCubit() : super(TermsInitialState());
  static TermsCubit get(context) => BlocProvider.of(context);
  List<TermsData> data = [];
  Future GetTerms(
      {
        token,
        context}
      ) async {
    emit(TermsLoadingState());
    DioHelper.getData(url: termsEndPoint,token: token
    ).then((value) async{
      if (value.statusCode == 200){
        TermsModel termsModel=TermsModel.fromJson(json: value.data) ;
        data = termsModel.termsDataList;
        // flutterToast(msg:data.length.toString() , color: Colors.green);
        emit(TermsSuccessState());
        // return data;
      }
    },).catchError((error){
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color:Colors.red);
        print(error.toString());
      }
      emit(TermsErrorState());
    });
    return data;
  }
}
