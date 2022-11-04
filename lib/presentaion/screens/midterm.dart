import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/midtermitem.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';

class MidTerm extends StatefulWidget {
  const MidTerm({Key? key}) : super(key: key);

  @override
  State<MidTerm> createState() => _MidTermState();
}

class _MidTermState extends State<MidTerm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,

        title: const Center(
          child:Text('MidTerms',style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
          ),

      ),
      body: SafeArea(
        child: ListView(
          children: [
            MedtermItem(text:'Flutter',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
            MedtermItem(text:'Flutter',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
            MedtermItem(text:'Flutter',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
            MedtermItem(text:'Flutter',time:'2hrs',ExamDate:'2022-08-18',StartDate: '12:00pm',EndDate: '2:00pm',),
          ],
        ) ),
    );
  }
}

