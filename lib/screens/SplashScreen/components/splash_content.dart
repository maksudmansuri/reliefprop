import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.image}) : super(key: key);
  final String? text,image;
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
        Text(text!,textAlign: TextAlign.center,),
        Spacer(flex: 2,),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
