import 'package:flutter/material.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({Key? key, required this.text, required this.image}) : super(key: key);
  final String? text,image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("Relief Pro",style: TextStyle(
          fontSize: getProportionateScreenHeight(36),
          color: rPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        ),
        Text(widget.text!,textAlign: TextAlign.center,),
        Spacer(flex: 2,),
        Image.asset(
          widget.image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
