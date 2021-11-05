import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("OTP Verification",style: headingStyle ,),
              SizedBox(height: getProportionateScreenHeight(30),),
              Text("Relax. We will automatically validate OTP", textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expired in "),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end: 0.0),
                    duration: Duration(seconds: 30),
                    builder: (_, dynamic value, child) => Text(
                      "00:${value.toInt()}",
                      style: TextStyle(color: Colors.red),
                    ),
                    onEnd:(){},
                  ),

                ],
              ),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}


