import 'package:flutter/material.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",textAlign: TextAlign.center,
          style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
          ),),
      ),
      body: Body(),
    );
  }
}
