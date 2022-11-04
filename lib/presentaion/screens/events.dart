import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:orange_ws/Widget/calender.dart';

import '../../Widget/widget.dart';

class DefaultEvents extends StatefulWidget {
  const DefaultEvents({Key? key}) : super(key: key);

  @override
  State<DefaultEvents> createState() => _DefaultEventsState();
}

class _DefaultEventsState extends State<DefaultEvents> {
  // var c = EventController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: DefaultText(text: 'Event',color: Colors.black,size: 20, ),
        ),
        body: const MonthView());
  }

}
// controller: c
// List <CalenderEventData> events= [
//
// ]


