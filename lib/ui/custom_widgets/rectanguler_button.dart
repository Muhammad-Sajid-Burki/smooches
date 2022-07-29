import 'package:flutter/material.dart';
import 'package:smooches/core/constant/colors.dart';

class RectangularButton extends StatelessWidget {
  final text;
  final onPressed;
  final textColor;
  final buttonColor;

  RectangularButton({
    @required this.text,
    @required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: this.buttonColor,
      textColor: this.textColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600,
            fontSize: 18,),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
