import 'package:flutter/material.dart';
import 'package:reliefprop/screens/SplashScreen/splash_screen.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:reliefprop/styles/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class LoginSplashScreen extends StatefulWidget {
  const LoginSplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splashlogin";

  @override
  _LoginSplashScreenState createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {
  void initState(){
    super.initState();
    _navigatetomain();
  }

  _navigatetomain() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    print("token for   ${val}");
    if (val != null) {
      print("why r u here in null");
      Navigator.pushReplacement(
          this.context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else{
      print("it is null but teken some where");
      Navigator.pushReplacement(
          this.context, MaterialPageRoute(builder: (context) => SplashScreen(),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rPrimaryColor,
      body: Container(
        child: Center(
          child: Image.asset(LogoR,width: 100,),
        ),

      ),
    );
  }
}
