import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key,required this.text,this.color,this.size}) : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.deepOrange
          ),
          margin: EdgeInsets.only(top: 15.sp,bottom: 15.sp),
          width: 260.sp,
          height:50.sp,
          // color: Colors.deepOrange,
          child: Center(
            child:DefaultText(text: text, color:color, size: size,),
          )
      ),
      onTap: (){
      },
    );
  }
}
