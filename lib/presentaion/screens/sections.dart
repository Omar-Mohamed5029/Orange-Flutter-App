import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widget/midtermitem.dart';
import '../../business _logic/sections/sections_cubit.dart';
import '../../data/models/sections/sections_model.dart';

class Section extends StatefulWidget {
   Section({Key? key}) : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  List<SectionsData> list =[];
  var token;

  getdata(SectionCubit lecturesCubit) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token= await preferences.getString('token');
    // list= await  lecturesCubit.GetLectures(token: await preferences.getString('token'),context: context);
    list= await BlocProvider.of<SectionCubit>(context).GetSections(token: token,context: context) as List<SectionsData>;
  }


  @override
  Widget build(BuildContext context) {
    SectionCubit sectionCubit = SectionCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,

        title: const Center(
          child:Text('Sections',style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
          ),
        ),

      ),
      body:  FutureBuilder(
          future:getdata(sectionCubit),
          builder: (context,snapshot){
            while(list.isEmpty){
              return  Center(child: CircularProgressIndicator());
            }
            // Future.delayed(Duration(seconds: 2), () {
            //   return Center(child: CircularProgressIndicator());
            // });
              return
                SafeArea(
                    child: ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return
                            MedtermItem(text:list[index].sectionSubject.toString(),
                              time:'2hrs',
                              ExamDate:list[index].sectionDate.toString(),
                              StartDate: list[index].sectionStartTime.toString(),
                              EndDate: list[index].sectionEndTime.toString()
                              ,);
                        }
                    )
                );
          }


      ),
    );
  }
}
