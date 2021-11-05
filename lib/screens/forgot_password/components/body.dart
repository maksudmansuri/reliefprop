import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/components/no_account_text.dart';
import 'package:reliefprop/sizeConfig.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),),
          child: Column(
            children:[
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("Forgot Password",style:TextStyle(fontSize: getProportionateScreenWidth(28),color: Colors.black,fontWeight: FontWeight.bold,)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("Please Enter Your Email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,

              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey =GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (newValue) => email = newValue,
            onChanged: (value){
              if(value.isNotEmpty && errors.contains(rEmailNullError)){
                setState(() {
                  errors.remove(rEmailNullError);
                });
              }else{
                if(emailValidatorRegExp.hasMatch(value) && errors.contains(rInvalidEmailError) ){
                  setState(() {
                    errors.remove(rInvalidEmailError);
                  });
                }


              }
              return null;

            },
            validator:(value){
              if(value!.isEmpty && !errors.contains(rEmailNullError)){
                setState(() {
                  errors.add(rEmailNullError);
                });
              }else{
                if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(rInvalidEmailError) ){
                  setState(() {
                    errors.add(rInvalidEmailError);
                  });
                }
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter Email/Mobile",
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20)
                ),
                child: Icon(Icons.email),

              ),

            ),

          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors:errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(text:"Continue",
              press: (){
                if(_formKey.currentState!.validate()){}

              },
              ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),

    );
  }
}
