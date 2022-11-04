import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business _logic/terms/terms_cubit.dart';
import '../../business _logic/terms/terms_state.dart';
import '../../data/models/terms/terms_model.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  List<TermsData> list =[];
  var token;


  getdata() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token= await preferences.getString('token');
    // list= await  lecturesCubit.GetLectures(token: await preferences.getString('token'),context: context);
    list= await BlocProvider.of<TermsCubit>(context).GetTerms(token: token,context: context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsCubit,TermsState>(builder: (context, state){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
            child:Text('Terms and Conditions',style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            ),
          ),

        ),
        body: FutureBuilder(
            future:getdata(),
            initialData: Future.delayed(Duration(seconds: 2)),
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
                          // print(htmlEscape.convert(list[index].Terms)/);

                        }
                    )
                );
            }


        ),
      );
    });

  }
}
