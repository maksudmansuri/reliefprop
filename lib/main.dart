import 'package:flutter/material.dart';
import 'package:reliefprop/constants.dart';
import 'package:reliefprop/routes.dart';
import 'package:reliefprop/screens/SplashScreen/splash_screen.dart';
import 'package:reliefprop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

