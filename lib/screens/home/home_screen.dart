import 'package:flutter/material.dart';

//import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen",textAlign: TextAlign.center,
          style:TextStyle(
              color: Color(0xFF555555),
              fontSize: 20
          ),),
      ),
  //    body: Body(),
    );
  }
}
