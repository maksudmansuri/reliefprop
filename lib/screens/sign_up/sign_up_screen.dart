import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up";
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
