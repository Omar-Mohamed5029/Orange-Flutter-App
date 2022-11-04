import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Calenders extends StatelessWidget {
  const Calenders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MonthView());
  }
}


