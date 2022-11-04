import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/note/note_database.dart';
import '../../data/models/note/note_model.dart';
import 'notes.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
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
                        controller: title,
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
                    child: TextField(
                      // maxLength: 20,
                      maxLines: 5,
                      controller:description,
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
                        labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),

                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  MaterialButton ( onPressed: ()async{
                   final note = Note(title: title.text, description: description.text, createdTime: DateTime.now());
                   await NotesDatabase.instance.create(note);
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Notes(),
                     ),
                   );

                  },
                    child:  Text(
                      'Add Note',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp
                      ),
                    ),
                    color: Colors.deepOrange,
                    height: 40.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
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
