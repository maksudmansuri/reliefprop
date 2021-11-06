import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import 'package:reliefprop/APIs/APIs.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? phoneNumber;
  String? password;
  String? confirm_password;
  bool remember = false;
  final List<String>errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
    }

  @override
  Widget build(BuildContext context) {

    return Form(
      key:_formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: rEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: rInvalidEmailError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: rEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: rInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter Email",
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20)
                ),
                child: Icon(Icons.email),

              ),

            ),

          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: rPhoneNumberNullError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: rPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter Phone",
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20)
                ),
                child: Icon(Icons.phone),

              ),

            ),

          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: rPassNullError);
              } else if (value.length >= 8) {
                removeError(error: rShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: rPassNullError);
                return "";
              } else if (value.length < 4) {
                addError(error: rShortPassError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter Password",
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20)
                ),
                child: Icon(Icons.lock),

              ),

            ),

          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => confirm_password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: rPassNullError);
              } else if (value.isNotEmpty && password == confirm_password) {
                removeError(error: rMatchPassError);
              }
              confirm_password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: rPassNullError);
                return "";
              } else if ((password != value)) {
                addError(error: rMatchPassError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              //labelText: ,
              hintText: "Confirm Password",
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20)
                ),
                child: Icon(Icons.lock),

              ),

            ),

          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30),),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ValidatePhone();
                // if all are valid then go to success screen
              }
            },
          ),
        ],
      ),
    );
  }


  Future<void>ValidatePhone()async{
    var response = await http.post(Uri.parse(validatePhone),body: ({'phone':phoneNumber}));
    final body = jsonDecode(response.body);
    print(body['status']);
    if(response.statusCode==200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Succesfully Sent")));
      var otp = body["opt"];
      print(otp);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>OtpScreen(otp:otp,phone:phoneNumber,email:email,password:password)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("invalide Credential")));
    }
    print(response);

  }
}


