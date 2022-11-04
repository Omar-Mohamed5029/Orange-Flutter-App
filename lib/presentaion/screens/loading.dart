import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:orange_ws/business%20_logic/auth/register/register_cubit.dart';
import 'package:orange_ws/presentaion/screens/register/regiseter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

// import 'package:orange_ws/presentaion/screens/register/regiseter_screen.dart';
// import 'package:sizer/sizer.dart';
// import 'package:splashscreen/splashscreen.dart';

import '../../layout/navbar.dart';
import 'login/login.dart';

class DefaultSplashScreen extends StatefulWidget {
  const DefaultSplashScreen({Key? key}) : super(key: key);

  @override
  State<DefaultSplashScreen> createState() => _DefaultSplashScreenState();
}

class _DefaultSplashScreenState extends State<DefaultSplashScreen> {
  var token;
  gettoken()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token= await preferences.getString('token');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: gettoken() ,
          builder: (context,snapshot){
            return EasySplashScreen(
              logo: Image.asset('assets/orange_logo.png',),
              backgroundColor: Colors.deepOrange,
              showLoader: true,
              loadingText: Text("Loading..."),
              navigator: token==null?Login():NavBar(),
              durationInSeconds: 4,
              logoWidth: 100.sp,
            );
          }
        )
    );
  }
}
//flutter run --no-sound-null-safety

// SplashScreen(
// seconds: 4,
// backgroundColor: Colors.deepOrange,
// image: Image.asset('assets/orange_logo.png') ,
// loaderColor: Colors.black,
// photoSize: 100.0.sp,
// navigateAfterSeconds: RegisterScreen(),
// // navigateAfterSeconds: email == null ?  Sign() : BottomNavBar(),
// ),
