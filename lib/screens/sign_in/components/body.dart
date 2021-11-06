import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/components/no_account_text.dart';
import 'package:reliefprop/components/socal_card.dart';
import 'package:reliefprop/screens/sign_in/components/sign_form.dart';
import 'package:reliefprop/sizeConfig.dart';



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

