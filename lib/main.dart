import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/Widget/calender.dart';
import 'package:orange_ws/business%20_logic/auth/login/login_cubit.dart';
import 'package:orange_ws/business%20_logic/auth/register/register_cubit.dart';
import 'package:orange_ws/business%20_logic/lectures/lectures_cubit.dart';
import 'package:orange_ws/business%20_logic/university/university_cubit.dart';
import 'package:orange_ws/data/data_provider/remote/dio_helper.dart';
import 'package:orange_ws/layout/navbar.dart';
import 'package:orange_ws/presentaion/screens/addnotes.dart';
import 'package:orange_ws/presentaion/screens/events.dart';
import 'package:orange_ws/presentaion/screens/faq.dart';
import 'package:orange_ws/presentaion/screens/finals.dart';
import 'package:orange_ws/presentaion/screens/lectures.dart';
import 'package:orange_ws/presentaion/screens/loading.dart';
import 'package:orange_ws/presentaion/screens/login/login.dart';
import 'package:orange_ws/presentaion/screens/midterm.dart';
import 'package:orange_ws/presentaion/screens/notes.dart';
import 'package:orange_ws/presentaion/screens/register/regiseter_screen.dart';
import 'package:orange_ws/presentaion/screens/sections.dart';
import 'package:orange_ws/presentaion/screens/show_note.dart';
import 'package:orange_ws/presentaion/screens/university.dart';
import 'package:sizer/sizer.dart';

import 'business _logic/final/finals_cubit.dart';
import 'business _logic/sections/sections_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientaion, deviceType) {
      return CalendarControllerProvider(
        controller: EventController(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LogInCubit(),
            ), BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
                create: (context) => LecturesCubit()
            ),
            BlocProvider(
                create: (context) => SectionCubit()
            ),
            BlocProvider(
                create: (context) => FinalCubit()
            ),
            BlocProvider(
                create: (context) => UniversityCubit()
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const DefaultSplashScreen(),
            routes: {
              'lectures': (context) =>  Lectures(),
              'section': (context) =>  Section(),
              'events' : (context) =>const DefaultEvents(),
              'midterm' :(context) => const MidTerm(),
              'notes' : (context) => const Notes(),
              'register' : (context) => const RegisterScreen(),
              'addnotes' : (context) => const AddNotes(),
              'navbar' :  (context) => const NavBar(),
              'login' :  (context) => const Login(),
              'FAQ': (context) => const FAQ(),
              'finals': (context) =>  Finals(),
              'university' : (context)=> const University(),
            },
          ),
        ),
      );
    });
  }
}
//   MultiBlocProvider(
//   providers: [
//     BlocProvider(
//       create: (context) => LogInCubit(),
//     ),
//   ],
//   child: MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'ODC',
//     theme: ThemeData(
//       primarySwatch: Colors.deepOrange,
//     ),
//     home: DefaultSplashScreen(),
//   ),
// );