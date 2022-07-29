
import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

class InputTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? isPasswordActive;
  final String? Function(String?)? validation;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  InputTextFormField({this.hintText, this.isPasswordActive = false, this.validation, this.controller, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller ?? TextEditingController(),
      validator: validation,
      obscureText: isPasswordActive!,
      onChanged: onChanged,
      cursorColor: primaryColor,
      decoration: InputDecoration(
//                      labelText: "Name",
//      suffixIcon: isPasswordActive,
          hintText: "$hintText",
          hintStyle: TextStyle().copyWith(fontSize: 15),
          filled: true,
          fillColor: backgroundColor,
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          disabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: primaryColor
            ),


          )
      ),
    );
  }
}
