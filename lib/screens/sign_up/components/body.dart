import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/components/socal_card.dart';
import 'package:reliefprop/screens/sign_up/components/sign_up_form.dart';
import 'package:reliefprop/sizeConfig.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Create An Account",style: headingStyle
              ),
              SizedBox(height: getProportionateScreenHeight(5),),
              Text("Complete your details or continue \nwith social media",textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.03,),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.03,),
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
              Text("By Continuing your confirm that you agree \nwith Term and condition",
              textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
