import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/constants.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:reliefprop/screens/sign_in/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Text("Sign In",
            textAlign: TextAlign.center,
            style:TextStyle(
              color: rPrimaryColor,
              fontSize: 20
            ),
          ),
        ),
      ),
      body: Body(),

    );
  }
}

