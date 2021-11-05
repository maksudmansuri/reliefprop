import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification", textAlign: TextAlign.center,
          style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
          ),),
      ),
      body: Body(),
    );
  }
}
