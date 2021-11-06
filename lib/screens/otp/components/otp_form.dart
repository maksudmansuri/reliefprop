import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reliefprop/APIs/APIs.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../sizeConfig.dart';
import 'package:http/http.dart' as https;

class OtpForm extends StatefulWidget {
  final String? phone;
  final String? email;
  final String? password;
  final int? otp;
  const OtpForm({
    Key? key,
    required this.phone,
    required this.email,
    required this.password,
    required this.otp
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    super.initState();
    _listOPT();

  }

  @override
  void dispose() {
    super.dispose();
    SmsAutoFill().unregisterListener();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enter PIN "),
                    Container(
                      child:  PinFieldAutoFill(
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(fontSize: 20, color: Colors.black),
                          colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                        ),
                        codeLength: 4,
                        onCodeSubmitted: (code) {},
                        onCodeChanged: (code) {
                          if (code!.length == 6) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
                OTPVerify();
              },

          )
        ],
      ),
    );
  }


  Future<void>OTPVerify()async{
    var phone = widget.phone;
    var email = widget.email;
    var password = widget.password;
    var otp = widget.otp.toString();

    var response = await https.post(Uri.parse(validateotp),body: ({'phone':phone,'otp':otp}));
    final body = jsonDecode(response.body);
    print(body['status']);
    if(body['status'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Succesfully verified OTP")));
      register();
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("invalid OPT")));
    }

  }

  Future<void>register()async{
    var phone = widget.phone;
    var email = widget.email;
    var password = widget.password;
    var response1 = await https.post(Uri.parse(registerAPI),body: ({'email':email,'phone':phone,'username':phone,'user_type':"4",'password':password}));
    final body1 = jsonDecode(response1.body);
    if(response1.statusCode==200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Succesfully login")));
      print("login Token " + body1["token"]);
      SharedPreferences  pref = await SharedPreferences.getInstance();
      await pref.setString("Login", body1["token"]);
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something wrong")));
    }

  }

  _listOPT()
  async {
    await SmsAutoFill().listenForCode;
  }
}