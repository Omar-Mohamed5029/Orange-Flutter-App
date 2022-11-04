import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../Widget/login_textfield.dart';
import '../../../Widget/widget.dart';
import '../../../business _logic/auth/login/login_cubit.dart';
import '../../../business _logic/auth/login/login_state.dart';
import '../../../constants/constant_methods.dart';
import '../../../layout/navbar.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String? token;

  
  // gettoken()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   token= await preferences.getString('token');
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    LogInCubit loginCubit = LogInCubit.get(context);
    // gettoken();
    // // flutterToast(msg:"omar${token}" , color: Colors.green);
    //
    // if(token!=null){
    //   // flutterToast(msg:"omar${token}" , color: Colors.green);
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => NavBar()),
    //         (Route<dynamic> route) => false,);
    // }
   return BlocBuilder<LogInCubit, LogInState>(
        builder: (context, state)
    {
      return Scaffold(
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0.sp, bottom: 20.0.sp),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Orange ',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              fontSize: 25),
                        ),
                        TextSpan(
                          text: 'Digital Center',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: DefaultText(
                  text: 'LogIn', color: Colors.deepOrange, size: 20.sp,),
                margin: EdgeInsets.only(left: 10.sp),
              ),
              SizedBox(height: 15.0.sp),
              Container(
                margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
                child: Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      LoginTextField(
                          login_password: loginCubit,
                          controller: emailcontroller,
                          icon: Icons.email,
                          label: 'E-mail',
                          type: TextInputType.emailAddress,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Email';
                            } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                .hasMatch(value)) {
                              return 'Please Enter Valid as example@gmail.com';
                            }
                          }),

                      SizedBox(height: 15.0.sp),
                      LoginTextField(
                          login_password: loginCubit,
                          controller: passwordcontroller,
                          icon: Icons.lock,
                          label: 'Password',
                          type: TextInputType.text,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                          }),SizedBox(height: 5.sp,),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          child: const Text(
                            'Forget Password?!',
                            style: TextStyle(color: Colors.deepOrange,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                // barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15.0)),
                                    title: const Text(
                                      'Forget Password',
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'send',
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.black,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius.circular(15.0))),
                                          )
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'cancel',
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.black,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius.circular(15.0))),
                                          )
                                      ),
                                    ],
                                    content: LoginTextField(
                                        login_password: loginCubit,
                                        controller: passwordcontroller,
                                        icon: Icons.lock,
                                        label: 'Password',
                                        type: TextInputType.text,
                                        validation: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter Your Password';
                                          }
                                        }),
                                  );
                                }
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15.0.sp),
                      InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.deepOrange
                            ),
                            margin: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
                            width: 260.sp,
                            height: 50.sp,
                            // color: Colors.deepOrange,
                            child: Center(
                              child: DefaultText(text: 'Register', color: Colors
                                  .white, size: 20.sp,),
                            )
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'register');
                        },
                      ),
                      Row(
                          children: <Widget>[
                            Expanded(
                                child: Divider()
                            ),
                            DefaultText(text: 'OR',
                              color: Colors.deepOrange,
                              size: 20.sp,),
                            Expanded(
                                child: Divider()
                            ),
                          ]
                      ),
                      SizedBox(height: 15.0.sp),
                      InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.deepOrange)
                            ),
                            margin: EdgeInsets.only(top: 15.sp),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.2,
                            height: 50.sp,
                            // color: Colors.deepOrange,
                            child: Center(
                              child: DefaultText(text: 'Sign In', color: Colors
                                  .deepOrange, size: 20.sp,),
                            )
                        ),
                        onTap: () {
                          if (loginKey.currentState!.validate()) {
                            loginCubit.postlogin(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                              context: context
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      );
    });
  }
}
