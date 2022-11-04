import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orange_ws/Widget/notes_item.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/models/note/note_database.dart';
import '../../data/models/note/note_model.dart';
import 'addnotes.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
    // NotesDatabase.instance.close();
    // dispose();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  Future<void> _close(Database db) async {
    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:
            // Row(
            // children: [
            // IconButton(onPressed:(){
            //   Navigator.of(context)
            //       .pushNamedAndRemoveUntil('navbar', (Route<dynamic> route) => false);
            // }, icon: Icon(Icons.arrow_back)),
            const Text('Notes'),
        //   ],
        // )
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.orange,
            ))
          : notes.isEmpty
              ? Center(
                  child: Text(
                    'No Notess',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Notes_Item(
                      note: notes[index],
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, 'addnotes');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddNotes(),
            ),
          );
          // Navigator.pushNamed(context, 'addnotes').then((_) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
