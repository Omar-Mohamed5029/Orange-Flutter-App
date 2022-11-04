import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Widget/newsitem.dart';
import '../../Widget/widget.dart';
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  ListView(
          children: [
           Container(
             margin: EdgeInsets.only(top:20.sp),
             child: const Center(
                child: DefaultText(text:'News',color: Colors.black, size: 30),
              ),
           ),
            NewItem(text: 'ODCs',),
            NewItem(text: 'ODCs',),
            NewItem(text: 'ODCs',),
            NewItem(text: 'ODCs',),
          ],
        ),
      ),
    );
  }
}
