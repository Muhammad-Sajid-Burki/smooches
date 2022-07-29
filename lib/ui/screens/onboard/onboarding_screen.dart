import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooches/core/constant/colors.dart';
import 'package:smooches/ui/screens/onboard/diamond_screen/diamond_screen.dart';
import 'package:smooches/ui/screens/onboard/gold_screen/gold_screen.dart';
import 'package:smooches/ui/screens/onboard/silver_screen/silver_screen.dart';
import 'package:smooches/ui/screens/registeration_auth/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightBlueColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20).r,
              child: Row(
                children: [
                  Image.asset('Assets/logo.png', height: 70.h, width: 70.w,),
                  Text('Smooches', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 23.sp),)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30).r,
                child: PageView(
                  controller: _controller,
                  // itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: [
                    SilverScreen(),
                    GoldScreen(),
                    DiamondScreen(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => buildDot(index, context),
              ),
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 60).r,
              width: double.infinity,
              child: FlatButton(
                child: Text(
                    "Next", style: TextStyle(fontSize: 18.sp),),
                onPressed: () {
                  if (currentIndex == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    );
                  }
                  _controller?.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40).r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8.h,
      width:  8.h,
      margin: EdgeInsets.only(right: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: currentIndex == index ? Theme.of(context).primaryColor : Colors.white,
      ),
    );
  }
}