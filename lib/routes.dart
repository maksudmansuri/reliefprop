
import 'package:flutter/widgets.dart';
import 'package:reliefprop/screens/SplashScreen/login_splash_screen.dart';
import 'package:reliefprop/screens/SplashScreen/splash_screen.dart';
import 'package:reliefprop/screens/complete_profile/complete_profile_screen.dart';
import 'package:reliefprop/screens/forgot_password/forgot_password_screen.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:reliefprop/screens/otp/otp_screen.dart';
import 'package:reliefprop/screens/sign_in/sign_in_screen.dart';
import 'package:reliefprop/screens/sign_up/sign_up_screen.dart';

final Map<String,WidgetBuilder> routes = {
  LoginSplashScreen.routeName: (context) => LoginSplashScreen(),

  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  //OtpScreen.routeName: (context) => OtpScreen(),

  HomeScreen.routeName: (context) => HomeScreen()




};
