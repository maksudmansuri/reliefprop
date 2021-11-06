import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  final String? phone;
  final String? email;
  final String? password;
  final int? otp;
  const OtpScreen({Key? key,required this.otp,required this.phone, required this.email,required this.password}) : super(key: key);
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification ${otp}", textAlign: TextAlign.center,
          style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
          ),),
      ),
      body: Body(phone:phone,email:email,password:password,otp:otp),
    );
  }
}
