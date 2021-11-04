import 'package:flutter/widgets.dart';
import 'package:reliefprop/screens/SplashScreen/splash_screen.dart';
import 'package:reliefprop/screens/sign_in/sign_in_screen.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),


};
