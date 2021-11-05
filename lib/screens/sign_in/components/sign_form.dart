import 'package:flutter/material.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/screens/forgot_password/forgot_password_screen.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);


  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String>errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column(

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
                child: Icon(Icons.phone),

              ),

            ),

          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value){
              if(value.isNotEmpty && errors.contains(rPassNullError)){
                setState(() {
                  errors.remove(rPassNullError);
                });
              }else{
                if(value.length >= 4 && errors.contains(rShortPassError)){
                  setState(() {
                    errors.remove(rShortPassError);
                  });
                }
                {

                }}
              return null;

            },
            validator:(value){
              if(value!.isEmpty && !errors.contains(rPassNullError)){
                setState(() {
                  errors.add(rPassNullError);
                });
              }else{
                if(value.length < 4 && !errors.contains(rShortPassError)){
                  setState(() {
                    errors.add(rShortPassError);
                  });
                }
                {

                }}
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
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(value: remember,activeColor: rPrimaryColor ,onChanged: (value){
                setState(() {
                  remember = value;
                });
              }),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: Text("Forgot Password",style: TextStyle(decoration: TextDecoration.underline),))
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(text: "Continue",press: (){
            if(_formKey.currentState!.validate() ){
              _formKey.currentState!.save();
            }
          },),
        ],
      ),
    );
  }
}