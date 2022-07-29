import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:smooches/core/constant/colors.dart';
import 'package:smooches/ui/custom_widgets/auth_message.dart';
import 'package:smooches/ui/custom_widgets/input_text_form_field.dart';
import 'package:smooches/ui/custom_widgets/rectanguler_button.dart';
import 'package:smooches/ui/custom_widgets/social_auth_button.dart';
import 'package:smooches/ui/screens/add_contact/add_contact_screen.dart';
import 'package:smooches/ui/screens/add_contact/add_contacts_screen.dart';
import 'package:smooches/ui/screens/onboard/onboarding_screen.dart';
import 'package:smooches/ui/screens/registeration_auth/sign_up/sign_up_screen.dart';

import '../../../../core/enums/view_state.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              ///
              /// Body Start From Here
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 65, 25, 28).r,

                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Welcome Back 👋️‍", style: TextStyle(color: primaryColor, fontSize: 24.sp, fontWeight: FontWeight.bold),),

                        SizedBox(height: 9.h,),

                        Text("We are happy to see you again.\nLogin to proceed.",
                          style: TextStyle().copyWith(
                            height: 1.2.h,
                            fontSize: 16.sp,
                          ),),

                        SizedBox(height: 45.h,),

                        ///
                        /// Email Text Field
                        ///
                        InputTextFormField(
                          hintText: "Email",
                          controller: TextEditingController(text: model.appUser.email),
                          validation: (String? val) {
                            if (val == null || val.length < 1)
                              return 'Please enter your email';
                            else
                              return null;
                          },
                          onChanged: (val) {
                            model.appUser.email = val;
                          },
                        ),

                        SizedBox(height: 10.h,),

                        ///
                        /// Password Text Field
                        ///
                        InputTextFormField(
                          hintText: "Password",
                          isPasswordActive: true,
                          controller: TextEditingController(text: model.appUser.password),
                          validation: (String? val) {
                            if (val == null || val.length < 6)
                              return 'Min Password length = 6 characters';
                            else
                              return null;
                          },
                          onChanged: (val) {
                            model.appUser.password = val;
                          },
                        ),

                        SizedBox(height: 144.h,),

                        ///
                        /// Registration Button
                        ///
                        Container(
                          height: 50.h,
                          width: double.infinity,
                          child: RectangularButton(
                            onPressed: () async{
                              if(_formKey.currentState!.validate()){
                                await model.loginWithEmailPassword();
                                if(model.authResult!.status!){
                                  Get.to(AddContactsScreen());
                                } else{
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Login Error'),
                                        content: Text(
                                            model.authResult?.errorMessage ??
                                                'Login Failed'),
                                      );
                                  },
                                  );
                                }
                              }
                            },
                            text: "Login",
                            textColor: Colors.white,
                            buttonColor: primaryColor,

                          ),
                        ),


                        ///
                        /// Or Text
                        ///
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15).r,
                            child: Text("or",textAlign: TextAlign.center ,style: TextStyle(  color: greyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,),),
                          ),
                        ),

                        // SocialAuthButton(
                        //   onPressed: () async{
                        //     await model.signInWithGoogle();
                        //     if(model.authResult.status){
                        //       Get.to(DashboardScreen());
                        //     } else{
                        //       showDialog(
                        //         context: context,
                        //         child: AlertDialog(
                        //           title: Text('Login Error'),
                        //           content: Text(
                        //               model?.authResult?.errorMessage ??
                        //                   'Login Failed'),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   buttonName: "Login with Google",
                        // ),

                        SizedBox(height: 30.h,),

                        ///
                        /// Don't Have Account Button
                        ///
                        Center(
                          child: AuthMessage(
                            onPressed: () => Get.to(SignUpScreen()),
                            text: "Don't",
                            authText: "Sign up",
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),),
        ),
      ),
    );
  }
}
