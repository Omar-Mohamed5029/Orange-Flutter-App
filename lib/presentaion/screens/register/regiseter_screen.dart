import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_ws/presentaion/screens/login/login.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/textfield.dart';
import '../../../Widget/widget.dart';
import '../../../business _logic/auth/register/register_cubit.dart';
import '../../../business _logic/auth/register/register_state.dart';
import '../../../layout/navbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController number = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String gender = 'None';

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return Scaffold(
          body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0.sp, bottom: 20.0.sp),
            child: const Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Orange ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 25),
                    ),
                    TextSpan(
                      text: 'Digital Center',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: DefaultText(
              text: 'Register',
              color: Colors.deepOrange,
              size: 20.sp,
            ),
            margin: EdgeInsets.only(left: 10.sp),
          ),
          SizedBox(height: 15.0.sp),
          Container(
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            child: Form(
              key: registerKey,
              child: Column(
                children: [
                  DefaultTextField(
                      controller: namecontroller,
                      register_password: registerCubit,
                      icon: Icons.drive_file_rename_outline_rounded,
                      label: 'Name',
                      type: TextInputType.emailAddress,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                      }),
                  SizedBox(height: 15.0.sp),
                  DefaultTextField(
                      controller: emailcontroller,
                      register_password: registerCubit,
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
                  DefaultTextField(
                      controller: passwordcontroller,
                      register_password: registerCubit,
                      icon: Icons.lock,
                      label: 'Password',
                      type: TextInputType.text,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Password';

                        }
                      }),
                  SizedBox(height: 15.0.sp),
                  DefaultTextField(
                      controller: confirmpassword,
                      register_password: registerCubit,
                      icon: Icons.lock,
                      label: 'Confirm Password',
                      type: TextInputType.text,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Password';
                        }else if(passwordcontroller.text != confirmpassword.text){
                          return 'Please Enter Your confirm password again';

                        }
                      }),
                  SizedBox(height: 15.0.sp),
                  DefaultTextField(
                      controller: number,
                      register_password: registerCubit,
                      icon: Icons.phone,
                      label: 'Number',
                      type: TextInputType.number,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Phone Number';
                        } else if (value.length != 11) {
                          return "Phone Number Must be 11 Number";
                        }
                      }),
                  SizedBox(height: 5.0.sp),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ListTile(
                      title: Text(
                        'Gender',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        gender,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: PopupMenuButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        itemBuilder: (BuildContext contex) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              child: Text(
                                'Male',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: 'male',
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Female',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: 'female',
                            ),
                          ];
                        },
                        onSelected: (value) {
                          gender = value;
                          registerCubit.changeGender(value);
                          // if (value == 'Male')
                          //   registerCubit.changeGender('m');
                          // else
                          //   registerCubit.changeGender('f');
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.deepOrange),
                        margin: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
                        width: 260.sp,
                        height: 50.sp,
                        // color: Colors.deepOrange,
                        child: Center(
                          child: DefaultText(
                            text: 'Register',
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        )),
                    onTap: () {

                        if (registerKey.currentState!.validate()) {
                          registerCubit.postRegister(
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                              phoneNumber: number.text,
                              context: context,
                              gender: registerCubit.gender == 'male' ? 'm' : 'f');
                        }

                    },
                  ),
                  Row(children: <Widget>[
                    const Expanded(child: Divider()),
                    DefaultText(
                      text: 'OR',
                      color: Colors.deepOrange,
                      size: 20.sp,
                    ),
                    const Expanded(child: Divider()),
                  ]),
                  SizedBox(height: 15.0.sp),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.deepOrange)),
                        margin: EdgeInsets.only(top: 15.sp),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50.sp,
                        // color: Colors.deepOrange,
                        child: Center(
                          child: DefaultText(
                            text: 'Sign In',
                            color: Colors.deepOrange,
                            size: 20.sp,
                          ),
                        )),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Login()),
                      // );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
    });
  }
}
