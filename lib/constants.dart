import 'package:flutter/material.dart';


const rPrimaryColor = Color(0xFF005374);
const rPrimaryLightColor = Color(0xFF7BC7E8);
const rPrimaryGrdientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E),Color(0xFFFF7643)],);
const rSecondaryColor = Color(0xFF979797);
const rTextColor = Color(0xFF757575);
const rAnimationDuration = Duration(milliseconds: 200);


// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String rEmailNullError = "Please Enter your email";
const String rInvalidEmailError = "Please Enter Valid Email or Mobile";
const String rPassNullError = "Please Enter your password";
const String rShortPassError = "Password is too short";
const String rMatchPassError = "Passwords don't match";
const String rNamelNullError = "Please Enter your name";
const String rPhoneNumberNullError = "Please Enter your phone number";
const String rAddressNullError = "Please Enter your address";
