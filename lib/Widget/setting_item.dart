import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all( 5.sp,),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius :BorderRadius.circular(15.0),
        ),

        child: ListTile(
            leading: DefaultText(text: text,color: Colors.black,size: 15.sp,),
            // onTap: () {
            //   // Navigator.push(context, MaterialPageRoute(builder: (_){return Result('Best Sellers');}) );
            // },
            trailing:
             Icon(Icons.arrow_forward_ios) ,


        ),
      ),
      onTap: (){
        Navigator.pushNamed(context,text);
      },
    );
  }
}
