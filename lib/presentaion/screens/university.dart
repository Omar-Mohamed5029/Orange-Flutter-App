import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/university_item.dart';
import '../../business _logic/university/university_cubit.dart';
import '../../business _logic/university/university_state.dart';
import '../../data/models/university/university_model.dart';

class University extends StatefulWidget {
  const University({Key? key}) : super(key: key);

  @override
  State<University> createState() => _UniversityState();
}

class _UniversityState extends State<University> {

  List<UniversityData> list =[];
  var token;


  getdata() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token= await preferences.getString('token');
    // list= await  lecturesCubit.GetLectures(token: await preferences.getString('token'),context: context);
    list= await BlocProvider.of<UniversityCubit>(context).GetUniversity(token: token,context: context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityCubit,UniversityState>(builder: (context, state){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
            child:Text('University',style: TextStyle(
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
              while(list.isEmpty){
                return  Center(child: CircularProgressIndicator());
              }
              return
                SafeArea(
                    child: ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return
                           University_Item(text: list[index].name.toString(),);


                        }
                    )
                );
            }


        ),
      );
    });
  }
}
