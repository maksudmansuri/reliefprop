import 'package:flutter/material.dart';
import 'package:reliefprop/components/custom_surfix_icon.dart';
import 'package:reliefprop/constants.dart';
import 'package:reliefprop/sizeConfig.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: Column(
          children: [
            Text("Complete Profile",style: headingStyle ,),
            Text("Complete your details or continue \nwith social media", textAlign: TextAlign.center),
            CompleteProfileForm(),

          ],
        ),
      ),
    );
  }
}


class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

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
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: rNamelNullError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: rNamelNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your last name",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
          ),
          ),
        ],
      ),
    );
  }
}


