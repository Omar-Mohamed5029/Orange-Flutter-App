import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Widget/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List Icon = [Icons.menu_book,Icons.people,Icons.request_page,Icons.contact_page,Icons.event_note_outlined,Icons.note_alt];
  List text= ['Lectures','Section', 'University','Finals','Events','Notes'];
  List classes=['lectures','section', 'university','finals','events','notes'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.sp),
     child: GridView.builder(
         gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 10.0,
             childAspectRatio:1.2,
             crossAxisSpacing: 10.0
         ) ,
         scrollDirection: Axis.vertical,
         itemCount: Icon.length,
         itemBuilder: (context,index){
           return Item(icon:Icon[index],text: text[index],classes: classes[index]);
         }
     ),
    );
  }
}