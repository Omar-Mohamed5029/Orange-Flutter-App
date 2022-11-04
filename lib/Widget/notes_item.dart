import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orange_ws/presentaion/screens/show_note.dart';
import 'package:sizer/sizer.dart';

import '../data/models/note/note_database.dart';
import '../data/models/note/note_model.dart';
import '../presentaion/screens/editnote.dart';
import '../presentaion/screens/notes.dart';

class Notes_Item extends StatefulWidget {
  const Notes_Item({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  State<Notes_Item> createState() => _Notes_ItemState();
}

class _Notes_ItemState extends State<Notes_Item> {
  @override
  Widget build(BuildContext context) {
    String yourDateTime =
        DateFormat('yyyy-MM-dd hh:mm').format(widget.note.createdTime);
    return Container(
        height: 80.sp,
        margin: EdgeInsets.only(top: 20.sp, left: 17.sp, right: 17.sp),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          child: ListTile(
            title:  Container(
              // padding: EdgeInsets.only(right: 100.sp),
              // margin: EdgeInsets.only(right: 100.sp),
              // color: Colors.red,
              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.note.title,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                    Text(
                      widget.note.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                    Text(
                      yourDateTime,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),

                  ]

              ),
            ),

            trailing:
           Container(
             alignment: Alignment.centerRight,
             width: 80.sp,
             // color: Colors.orange,
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 IconButton(onPressed: (){
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => EditNotes(note: widget.note),
                     ),
                   );
                 }, icon:Icon(Icons.edit),color: Colors.deepOrange,),
                 IconButton(onPressed: () async{
                   int total = widget.note.id?.toInt() ?? 0;
                   await NotesDatabase.instance.delete(total);
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Notes(),
                     ),
                   );
                 }, icon:Icon(Icons.delete),color: Colors.deepOrange,)
               ],
             ),
           )
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Show_Note(note: widget.note)),
            );
          },
        )
        // )
        );
  }
}
