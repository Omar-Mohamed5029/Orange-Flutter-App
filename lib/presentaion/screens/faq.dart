import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  double h=100;
  bool down=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:const Center(
          child: Text(
              'FAQ'
          ),
        ),
      ),
      body: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              margin: EdgeInsets.only(top:20.sp,right: 10.sp,left: 10.sp),
              child: Padding(
                padding: EdgeInsets.all(3.h),
                child: Column(
                  children: [
                   InkWell(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               child: Text(
                                 'Q:How many countries Orange'
                                     ' Digital Center is in?'
                                 ,style: TextStyle(
                                   fontSize: 15.sp,
                                   color: Colors.black
                               ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Icon(down==false?Icons.arrow_downward_rounded:Icons.arrow_upward_outlined),
                             )
                           ],

                     ),
                     onTap: (){
                       h=200;
                       setState(() {
                          down = !down;
                       });
                     },
                   ),
                    Visibility(
                        visible: down,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                      'Answer : 18',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.orange
                      ),
                    ),
                        ))


                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}
