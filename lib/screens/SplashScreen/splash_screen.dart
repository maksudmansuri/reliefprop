import 'package:flutter/material.dart';
import 'package:reliefprop/screens/SplashScreen/components/body.dart';
import 'package:reliefprop/sizeConfig.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(

      ),
    );
  }
}
