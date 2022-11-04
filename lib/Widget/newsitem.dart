import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/widget.dart';
import 'package:sizer/sizer.dart';
class NewItem extends StatelessWidget {
  const NewItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:180.sp ,
      margin: EdgeInsets.only(top:20.sp,left: 17.sp,right: 17.sp),
      decoration: BoxDecoration(
        color: Colors.grey[350],
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
              leading: DefaultText(text: text,color: Colors.white,size: 19.sp,),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_){return Result('Best Sellers');}) );
              },
              trailing: Container(
                width: 70.sp,
                  height: 45.sp,
                  // margin: EdgeInsets.only(top:10.sp),
                  decoration: BoxDecoration(
                    color:Colors.orange,
                    borderRadius :BorderRadius.circular(15.0),
                  ),
                child: Row(
                  children: [
                    IconButton(
                      icon:Icon(Icons.share) ,
                      color: Colors.white,
                      iconSize: 10.0.sp,
                      onPressed: (){
                      },
                    ),
                    IconButton(
                      icon:Icon(Icons.copy) ,
                      color: Colors.white,
                      iconSize: 10.0.sp,
                      onPressed: (){
                      },
                    )
                  ],
                ),
              )
          ),
           const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Orange ',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange ,fontSize: 30),
                  ),
                  TextSpan(
                    text: 'Digital Center',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                  ),
                ],
              ),
            ),
           Align(
              alignment: Alignment.bottomCenter,
              child: DefaultText(text: 'ODC Support All University',color: Colors.white,size: 10.sp,),
          ),

        ],
      ),
    );
  }
}
