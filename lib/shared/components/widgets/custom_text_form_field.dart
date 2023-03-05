

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class CustomTextFormField extends  StatelessWidget {
   CustomTextFormField({
     Key? key,
     required this.controller,
   required this.keyboard,
     required this.validate,
   this.onSubmit,
     this.onchange,
     this.onTap,
     required this.label,
      this.isClickable=true,
   required this.prefixIcon,
     this.suffixPressed,
     this.suffixIcon,
     this.isPassword=false,
     this.colorBorder,
     this.colorIcon

});
    TextEditingController controller;
    TextInputType keyboard;
   String? Function(String?)? validate;
   void Function(String)? onSubmit;
   void Function(String)? onchange;
   void Function()? onTap;
   String label;
   bool isClickable=true;
    dynamic prefixIcon;
   void Function()? suffixPressed;
   dynamic suffixIcon;
   bool isPassword = false;
   Color? colorIcon ;
   Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: colorIcon),
        enabledBorder: OutlineInputBorder(
            borderSide:BorderSide(
                color:colorBorder!
            )
        ),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );;
  }
}
