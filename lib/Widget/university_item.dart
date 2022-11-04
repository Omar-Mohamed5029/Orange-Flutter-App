import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';

class University_Item extends StatelessWidget {
  const University_Item({Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
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
      child:
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Center(
             child: Row(
               children: [
                 DefaultText(text: "University : ",color: Colors.black,size: 20.sp,),
                 DefaultText(text: text,color: Colors.black,size: 20.sp,),
               ],
             ),

            )
          ),





    );
  }
}
