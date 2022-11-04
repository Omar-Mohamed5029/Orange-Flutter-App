import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';

class FinalItem extends StatelessWidget {
  const FinalItem({Key? key,required this.text,required this.ExamDate,required this.StartDate
    ,required this.EndDate,required this.finalexam}) : super(key: key);
  final String text;
  final String ExamDate;
  final String StartDate;
  final String EndDate;
  final String finalexam;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      margin: EdgeInsets.only(top:20.sp,left: 17.sp,right: 17.sp),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius :BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                DefaultText(text: text,color: Colors.black,size: 20,),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    DefaultText(text:"final : ",size: 15,color: Colors.black,),
                    DefaultText(text:finalexam,size: 15,color: Colors.black,)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(text:'Exam Date',size: 15,color: Colors.grey,),
                DefaultText(text:'Start Date',size: 15,color: Colors.grey,),
                DefaultText(text:'End Date',size: 15,color: Colors.grey,)

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 15),
                    DefaultText(text:ExamDate,size: 15,color: Colors.black,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_filled, size: 15,color: Colors.green,),
                    DefaultText(text:StartDate,size: 15,color: Colors.black,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_filled_outlined, size: 15,color: Colors.pinkAccent,),
                    DefaultText(text:EndDate,size: 15,color: Colors.black,)
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
