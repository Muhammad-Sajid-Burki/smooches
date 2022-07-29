import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooches/core/constant/colors.dart';
import 'package:smooches/core/constant/constants.dart';
import 'package:smooches/ui/custom_widgets/description.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height.h * .44.h,
      width: size.width.w,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(30).r,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 10,
              offset: const Offset(1, 1),
            )
          ]
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15).r,
            child: Text(
              'Gold',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 23.sp),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30).r,

              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: orangeColor),
                          ),
                          TextSpan(
                            text: '30',
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w700,
                                color: orangeColor),
                          ),
                          TextSpan(
                              text: "/year",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: orangeColor)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10).r,
                    child: Column(
                      children: [
                        Description(text: "Lorem ipsum dolor sit amet"),
                        Description(text: "Lorem ipsum dolor sit amet, consectetur"),
                        Description(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
                        Description(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,),
                  Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        "Select this Plan", style: TextStyle(fontSize: 18.sp),),
                      onPressed: () {
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40).r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
