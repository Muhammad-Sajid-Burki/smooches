import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooches/core/constant/colors.dart';
import 'package:smooches/ui/screens/onboard/onboarding_screen.dart';

class AddContactScreen extends StatefulWidget {
  AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();

  Contact? _contact;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    _contact = await _contactPicker.selectContact();
                    setState(() {
                      _contact = _contact;
                    });
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80.r,
                        backgroundColor: primaryColor.withOpacity(.10),
                        child: CircleAvatar(
                          radius: 70.r,
                          backgroundColor: primaryColor.withOpacity(.30),
                          child: Icon(Icons.person, size: 120.r,),
                        ),
                      ),
                      Positioned(
                          bottom: 15,
                          right: 15,
                          child: CircleAvatar(
                            radius: 13.r,
                            child: Icon(Icons.add, size: 26.r,),
                          )
                          )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8).r,
                  child: Text("Add Contacts", style: TextStyle(color: greyTextColor, fontSize: 30.sp, fontWeight: FontWeight.w600),),
                ),
                Text("stay connected / Tagline", style: TextStyle(color: primaryColor.withOpacity(.80), fontWeight: FontWeight.w600),),

              ],
            ),
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 60).r,
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    "Next", style: TextStyle(fontSize: 18.sp),),
                  onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OnBoardingScreen(),
                        ),
                      );
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40).r,
                  ),
                ),
              )),
          Text(
            _contact == null ? 'No contact selected.' : _contact.toString(),
          ),
        ],
      ),
    );
  }
}
