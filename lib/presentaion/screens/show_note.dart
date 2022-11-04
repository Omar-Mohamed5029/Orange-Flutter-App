import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/note/note_model.dart';

class Show_Note extends StatelessWidget {
  const Show_Note({Key? key,required this.note}) : super(key: key);
  final Note note;


  @override
  Widget build(BuildContext context) {
    String yourDateTime =
    DateFormat('yyyy-MM-dd hh:mm').format(note.createdTime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: const Text('Show The Note')),
      ),
      body: Container(
        margin: EdgeInsets.all(10.sp),
        color: Colors.grey[100],
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
             child: Text(yourDateTime,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
            ),
            SizedBox(height: 10.sp,),
            Text(note.title,style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 10.sp,),
            Text(
              note.description,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
