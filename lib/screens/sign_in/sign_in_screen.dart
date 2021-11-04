import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Text("Sign In",
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
            ),
          ),
        ),
      ),
      body: Body(),

    );
  }
}

