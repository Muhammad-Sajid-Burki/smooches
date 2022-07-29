import 'package:flutter/material.dart';
import 'package:smooches/core/constant/colors.dart';

class AuthMessage extends StatelessWidget {
  final String? text;
  final String? authText;
  final void Function()? onPressed;
  AuthMessage({this.text, this.authText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("$text have an account?", textAlign: TextAlign.center,style: TextStyle().copyWith(fontSize: 14),),
      SizedBox(width: 10,),
      InkWell(
          onTap: onPressed,
          child: Text(" $authText", style: TextStyle().copyWith(fontSize: 14, color: primaryColor),))
      ],
    );
//    return RichText(
//        text: TextSpan(
//            text: "$text have an account?",
//            style: subHeadingTextStyle.copyWith(fontSize: 14),
//            children: [
//              TextSpan(
//                text: " $authText",
//                style: subHeadingTextStyle.copyWith(fontSize: 14, color: primaryColor),
//              )
//            ]
//        ));
  }
}
