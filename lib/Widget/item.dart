import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';



class Item extends StatelessWidget {
  const Item({Key? key , required this.icon,required this.text,required this.classes}) : super(key: key);
  final IconData icon;
  final String text;
  final String classes;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context,classes);
        },
        child:  Container(
            margin: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
              color: Colors.white,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: Colors.red,size:25.sp,),
                DefaultText(text:text , color: Colors.deepOrange, size: 13.sp,),
              ],
            )
        )
    );
  }
}


