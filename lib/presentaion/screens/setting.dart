import 'dart:io';

import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/setting_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Widget/widget.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}


class _SettingState extends State<Setting> {

  clear()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.all(20.sp),
              child: Center(
                child: DefaultText(text: 'Setting',color: Colors.black,size: 30.sp ),
              ),
            ),
            SettingItem(text: 'FAQ'),
            SettingItem(text: 'Terms & Condition'),
            SettingItem(text: 'Our Partenrs'),
      InkWell(
        child: Container(
          margin: EdgeInsets.all( 5.sp,),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius :BorderRadius.circular(15.0),
          ),

          child: ListTile(
            leading: DefaultText(text: 'Log In',color: Colors.black,size: 15.sp,),
            // onTap: () {
            //
            // },
            trailing:
            Icon(Icons.arrow_forward_ios) ,


          ),
        ),
        onTap: (){
          showDialog(
              context: context,
              // barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0)),
                    title: const Center(
                      child:  Text(
                        'Log Out !',
                        style: TextStyle(color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            clear();
                            exit(0);
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(15.0))),
                          )
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'cancel',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(15.0))),
                          )
                      ),
                    ]
                );
              }
          );
        },
      )
          ],
        ),
      ),
    );
  }
}
