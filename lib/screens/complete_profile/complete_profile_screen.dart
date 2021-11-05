import 'package:flutter/material.dart';
import 'package:reliefprop/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Complete Profile", textAlign: TextAlign.center,
            style:TextStyle(
                color: Color(0xFF555555),
                fontSize: 20
            ),
          ),
        ),
        body: Body(),
    );
  }
}
