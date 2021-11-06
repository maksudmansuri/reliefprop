import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reliefprop/APIs/APIs.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  final String? phone;
  final String? email;
  final String? password;
  final int? otp;
  const Body({Key? key,required this.otp,required this.phone, required this.email,required this.password}) : super(key: key);

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
              OtpForm(otp:otp,phone:phone,password:password,email:email),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                  resendOTP();
                },
                child: Text(
                  "Resend OTP Code ${otp}",
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
  Future<void>resendOTP()async{
    var response = await http.post(Uri.parse(validatePhone),body: ({'phone':phone}));
    final body = jsonDecode(response.body);
    print("Successfully sent");

  }
}


