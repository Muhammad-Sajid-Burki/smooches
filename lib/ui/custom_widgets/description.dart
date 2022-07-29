import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooches/core/constant/colors.dart';

class Description extends StatelessWidget {
  Description({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle, color: primaryColor, size: 20.r,),
            SizedBox(width: 10.w,),
            Expanded(child: Text(text, overflow: TextOverflow.clip, style: TextStyle(color: greyColor),))
          ],
        ),
      ),
    );
  }
}