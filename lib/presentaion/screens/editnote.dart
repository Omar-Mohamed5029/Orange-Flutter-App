import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../data/models/note/note_database.dart';
import '../../data/models/note/note_model.dart';
import 'notes.dart';


  class EditNotes extends StatefulWidget {
   EditNotes({Key? key,required this.note}) : super(key: key);
  Note note;
  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {

   String t = "o";
   String d= "m";
  @override
  void initState() {
    super.initState();
    t = widget.note.title == null? 'null':widget.note.title;
    d = widget.note.description == null? 'null':widget.note.description;
  }

   initialValue(val) {
     return TextEditingController(text: val);
   }


   TextEditingController title = TextEditingController();
 TextEditingController description = TextEditingController(text: 'Initial value');


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:const Center(
          child: Text(
              'Add Notes'
          ),
        ),
      ),
      body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top:20.sp,right: 10.sp,left: 10.sp),
              child: Column(
                children: [
                  TextFormField(
                    // initialValue: initialValue(t),
                    controller: title..text=t,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(vertical: 40), // <-- SEE HERE
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      labelText:'Title',
                      labelStyle: TextStyle(
                          color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: 20.sp,),
                  SizedBox(
                    child: TextFormField(
                      // maxLength: 20,
                      // initialValue: widget.note.title == null? 'null':widget.note.title,
                      maxLines: 5,
                      controller: description..text=d,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.red, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        labelText:'Description',
                        alignLabelWithHint: true,
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  MaterialButton(onPressed: ()async{

                    final updatenotes = Note(title: title.text, description: description.text, createdTime: DateTime.now(),id: widget.note.id);

                    await NotesDatabase.instance.update(updatenotes);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notes(),
                      ),
                    );
                  },
                      color: Colors.deepOrange,
                      height: 40.sp,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child:  Text(
                        'Edit Note',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp
                        ),
                      )
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}
