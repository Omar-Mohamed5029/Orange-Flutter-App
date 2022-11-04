import 'package:flutter/material.dart';
import 'package:orange_ws/business%20_logic/auth/login/login_cubit.dart';

import '../business _logic/auth/register/register_cubit.dart';

class DefaultTextField extends StatefulWidget {
   DefaultTextField({Key? key,required this.controller,required this.icon,required this.label,required this.type,required this.validation
   ,required this.register_password}) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final TextInputType type;
  Function validation;
   RegisterCubit register_password;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? visablity;


  @override
  Widget build(BuildContext context) {
    // RegisterCubit registerCubit = RegisterCubit.get(context);
    return TextFormField(
      validator: (value) => widget.validation(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        prefixIcon: Icon(widget.icon as IconData?, color: Colors.grey, size: 20.0,),
        labelText: widget.label,
        labelStyle: TextStyle(
            color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
        suffixIcon: widget.label == 'Password'? IconButton(
          icon: Icon(Icons.remove_red_eye),
          color: Colors.deepOrange,
          iconSize: 20.0,
          onPressed: () {
           widget.register_password.changePasswordVisibility();

          },
        ) : widget.label == 'Confirm Password'? IconButton(
          icon: Icon(Icons.remove_red_eye),
          color: Colors.deepOrange,
          iconSize: 20.0,
          onPressed: () {
            widget.register_password.changeConfirmPasswordVisibility();

          },
        ):null,
      ),
      keyboardType: widget.type,
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      obscureText:widget.label== 'Password'?widget.register_password.visiblePassword:
      widget.label== 'Confirm Password'?widget.register_password.visibleConfirmPassword:false,
    );
  }

}
