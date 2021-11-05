import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/components/no_account_text.dart';
import 'package:reliefprop/components/socal_card.dart';
import 'package:reliefprop/constants.dart';
import 'package:reliefprop/screens/forgot_password/forgot_password_screen.dart';
import 'package:reliefprop/screens/sign_in/components/sign_form.dart';
import 'package:reliefprop/sizeConfig.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20),),
                Text("Welcome Back",style:TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(28),fontWeight: FontWeight.bold,)),
                SizedBox(height: getProportionateScreenHeight(5),),
                Text("Sign In with your Mobile/Email and password \nor continue with social media",
                textAlign: TextAlign.center,),
                SizedBox(height: SizeConfig.screenHeight * 0.08,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SocalCard(
                      icon:"assets/icons/google-icon.svg",
                      press: (){},
                    ),
                    SocalCard(
                      icon:"assets/icons/facebook-2.svg",
                      press: (){},
                    ),

                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

