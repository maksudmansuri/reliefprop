import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/constants.dart';
import 'package:reliefprop/screens/SplashScreen/components/splash_content.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:reliefprop/screens/sign_in/sign_in_screen.dart';
import 'package:reliefprop/sizeConfig.dart';
import 'package:reliefprop/styles/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int CurrentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Relief Pro , Let’s book an appointment!",
      "image": slider1,
    },
    {
      "text":
      "We help people connect with Health Care System \naround India",
      "image": slider2,
    },
    {
      "text": "We show the easy way to book an appointment. \nJust stay at home with us",
      "image": slider3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
               // backgroundColor: Colors.purple,
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      CurrentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(splashData.length, (index) => BuildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 3),
                  DefaultButton(
                    text: "Continue",
                    press: () {
                     Navigator.popAndPushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  AnimatedContainer BuildDot({required int index}){
    return  AnimatedContainer(
      duration: rAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: CurrentPage == index ? 20:6,
      decoration: BoxDecoration(color: CurrentPage == index ? rPrimaryColor:Color(0xFFD8D8D8),borderRadius: BorderRadius.circular(3)),
    );

  }

}



