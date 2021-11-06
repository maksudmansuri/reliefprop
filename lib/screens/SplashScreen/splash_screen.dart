import 'package:flutter/material.dart';
import 'package:reliefprop/screens/SplashScreen/components/body.dart';
import 'package:reliefprop/screens/home/home_screen.dart';
import 'package:reliefprop/sizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if(val != null){
      //Navigator.pushReplacementNamed(context, HomeScreen.routeName,rou);
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(

      ),
    );
  }
}
