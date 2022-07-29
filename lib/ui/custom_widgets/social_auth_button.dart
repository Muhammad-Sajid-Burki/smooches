import 'package:flutter/material.dart';
import 'package:smooches/core/constant/colors.dart';

class SocialAuthButton extends StatelessWidget {
  final String? buttonName;
  final VoidCallback? onPressed;

  SocialAuthButton({this.buttonName, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0,0.6),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2.0,
            spreadRadius: 3.0

          ),
        ]
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.white,
        textColor: greyColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/static_assets/google_icon.png"),
                  )
                ),
              ),

              Text(
                "$buttonName",
                textAlign: TextAlign.center,
                style: TextStyle().copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        onPressed: this.onPressed,
      ),
    );;
  }
}
