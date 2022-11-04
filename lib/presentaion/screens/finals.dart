import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/exam_item.dart';
import '../../business _logic/final/final_state.dart';
import '../../business _logic/final/finals_cubit.dart';
import '../../data/models/final/fianls_model.dart';
class Finals extends StatefulWidget {
  const Finals({Key? key}) : super(key: key);

  @override
  State<Finals> createState() => _FinalsState();
}

class _FinalsState extends State<Finals> {

  List<FinalsData> list =[];
  var token;


  getdata() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token= await preferences.getString('token');
    // list= await  lecturesCubit.GetLectures(token: await preferences.getString('token'),context: context);
    list= await BlocProvider.of<FinalCubit>(context).GetExams(token: token,context: context);
  }

  @override
  Widget build(BuildContext context) {
    // FinalCubit finalCubit = FinalCubit.get(context);
    return  BlocBuilder<FinalCubit,FinalState>(
        builder: (context, state){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
            child:Text('Final',style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            ),
          ),

        ),
        body: FutureBuilder(
            future:getdata(),
            builder: (context,snapshot){
              if(list.isEmpty){
                return  Center(child: CircularProgressIndicator());
              }else
                return
                  SafeArea(
                      child: ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return
                              FinalItem(text:list[index].finalSubject.toString(),
                                ExamDate:list[index].finalDate.toString(),
                                StartDate: list[index].finalStartTime.toString(),
                                EndDate: list[index].finalEndTime.toString(),
                                // finalexam: list[index].exam.toString()
                                finalexam: "true"
                                ,);
                          }
                      )
                  );
            }


        ),
      );
    });
  }
}
