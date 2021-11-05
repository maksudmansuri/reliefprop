import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Forgot Password", textAlign: TextAlign.center,
          style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
          ),),

      ),
      body: Body(),

    );
  }
}

