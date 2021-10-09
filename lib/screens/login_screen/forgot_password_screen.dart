import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_lorder.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({ Key? key }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();

  bool isLogng= false;

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: FadeInLeft(
        duration: Duration(seconds: 1),
        child: SingleChildScrollView(
          child: Container(
            width: windowSize.width,
            child: Column(
              children: [
                Header(head1: "Forgot password", head2: "change Password"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Text("Please, enter your email address. You will receive a link to create a new password via email."),
                      SizedBox(height: 50,),
                      CustomTextFeild(hint: "email", controller: _email),
                      SizedBox(height: 40,),
                    ],
                  ),
                ),
                isLogng ? CustomLorder() : 
                CustomButton(
                  windowSize: windowSize,
                   name: "sent password reset email",
                    onPress: () async {
                      setState(() {
                        isLogng=true;
                      });
                       if (inputValidation()) {
                         await AuthController().sendPasswordResetemail(context, _email.text.toLowerCase());
                        _email.clear();
                      } 
                      else {
                        CustomAwesomDialog().dialogBox(
                          context,
                          "Error...!",
                          'Please check your input Details..!',
                          DialogType.ERROR);
                    }

                      setState(() {
                        isLogng=false;
                      });
                }
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }

bool inputValidation() {
    var isValid = false;
    if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }

}