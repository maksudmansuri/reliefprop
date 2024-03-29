import 'package:flutter/material.dart';
import 'package:reliefprop/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../sizeConfig.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont Have an Account? ",style:TextStyle(fontSize: getProportionateScreenWidth(16))),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(" Sign Up ",
                style:TextStyle(
                    color: rPrimaryColor, fontSize: getProportionateScreenWidth(16)
                )
            )
        ),
      ],
    );
  }
}
