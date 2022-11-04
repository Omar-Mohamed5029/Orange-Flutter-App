import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/data/models/lectures/lectures_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/midtermitem.dart';
import '../../business _logic/lectures/lectures_cubit.dart';
import '../../business _logic/lectures/lectures_state.dart';

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  List<LecturesData> list = [];
  var token;

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = await preferences.getString('token');
    // list= await  lecturesCubit.GetLectures(token: await preferences.getString('token'),context: context);
    list = await BlocProvider.of<LecturesCubit>(context)
        .GetLectures(token: token, context: context) as List<LecturesData>;
  }

  @override
  Widget build(BuildContext context) {
    // LecturesCubit lecturesCubit = LecturesCubit.get(context);
    // if(list.isEmpty){
    //   Future.delayed(const Duration(seconds: 1 ,),(){
    //     getdata(lecturesCubit);
    //     });
    // }
    return BlocBuilder<LecturesCubit, LecturesState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
            child: Text(
              'Lectures',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: FutureBuilder(
            future: getdata(),
            // initialData: Future.delayed(Duration(seconds: 2),(){
            //   return  Center(child: CircularProgressIndicator());
            // }),
            builder: (context, snapshot) {
              Future.delayed(Duration(seconds: 2), () {
                return Center(child: CircularProgressIndicator());
              });
              return SafeArea(
                  child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return MedtermItem(
                          text: list[index].lectureSubject.toString(),
                          time: '2hrs',
                          ExamDate: list[index].lectureDate.toString(),
                          StartDate: list[index].lectureStartTime.toString(),
                          EndDate: list[index].lectureEndTime.toString(),
                        );
                      }));
            }),
      );
    });
  }
}

// ListView(
// children: [
// MedtermItem(text:'Flutter',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
// MedtermItem(text:'Android',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
// MedtermItem(text:'wed',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
// MedtermItem(text:'ios',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
// ],
// )
