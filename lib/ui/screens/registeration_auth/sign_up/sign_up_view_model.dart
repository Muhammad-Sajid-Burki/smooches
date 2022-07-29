import 'package:smooches/core/enums/view_state.dart';
import 'package:smooches/core/models/app_user.dart';
import 'package:smooches/core/models/custom_auth_result.dart';
import 'package:smooches/core/services/auth_services.dart';
import 'package:smooches/core/services/database_services.dart';
import 'package:smooches/core/services/locator.dart';
import 'package:smooches/core/view_models/base_view_model.dart';


class SignUpViewModel extends BaseViewModel{

  AppUser appUser = AppUser();
  final _authService = locator<AuthService>();
  final _dbService = DatabaseService();
  CustomAuthResult? authResult;

  createAccount() async {
    print('@ViewModel/createAccount');
    setState(ViewState.busy);
    try {
      authResult = await _authService.signUpWithEmailPassword(appUser);
      if (authResult!.status!) {
        ///final newToken = await FirebaseMessaging().getToken();
        ///   _dbService.updateFcmToken(newToken, authResult.user.uid);
        ///      FirebaseMessaging().subscribeToTopic('students');
////      print('FCM Token generated: ${vendor.fcmToken}');
//      student.id = authResult.user.uid;
//      await _dbService.registerStudent(student);
      }
    } catch(e, s){
      print("@SignUp View Model createAccount Exception $e");
    }
    setState(ViewState.idle);
  }

  ///
  /// This method is For SignInWithGoogle
  ///
  // signInWithGoogle() async{
  //   setState(ViewState.busy);
  //   try{
  //     authResult = await _authService.signInWithGoogle();
  //     if(authResult.status){
  //       print("Login");
  //     }
  //   }catch(e, s){
  //     print("@AuthViewModel signInWithGoogle Exception: $e");
  //     print(s);
  //   }
  //   setState(ViewState.idle);
  // }
}