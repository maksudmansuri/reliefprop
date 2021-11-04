import 'package:flutter/material.dart';
import 'package:reliefprop/components/default_button.dart';
import 'package:reliefprop/components/form_error.dart';
import 'package:reliefprop/constants.dart';
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
          child: Column(
            children: [
              Text("Welcome Back",style:TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(28),fontWeight: FontWeight.bold,)),
              Text("Sign In with your Mobile/Email and password \nor continue with social media",
              textAlign: TextAlign.center,),
              SignForm(),
            ],
          ),
        ),
      ),

    );
  }
}



class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);


  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String>errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column(

        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (value){
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

                if(value.length > 10 || value.length < 10){
                  setState(() {
                    errors.add(rInvalidEmailError);
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

                if(value.length > 10 || value.length < 10){
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
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },

          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
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
          FormError(errors: errors),
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

