import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/screens/home_screen/home.dart';
import 'package:food_app/screens/login_screen/login_page_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({Key? key}) : super(key: key);

  @override
  _RegistrationPageScreenState createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  bool _passwordVisible = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeInRight(
          duration: Duration(seconds: 1),
          child: Container(
            width: windowSize.width,
            child: Column(
              children: [
                Header(
                  head1: "Registration",
                  head2: "Create Account",
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Name",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: primaryFontColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextFeild(
                        hint: "Rocket Nuwan",
                        controller: _name,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: primaryFontColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextFeild(
                        hint: "Sample@email.com",
                        controller: _email,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Phone",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: primaryFontColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextFeild(
                        hint: "0771234567",
                        controller: _phone,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: primaryFontColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextField(
                        controller: _password,
                        style: TextStyle(fontSize: 16, letterSpacing: 1),
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            fillColor: kwhite,
                            filled: true,
                            hintText: "••••••",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: IconButton(
                                splashColor: primaryColor,
                                splashRadius: 40,
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: greyColor,
                                ))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                CustomButton(
                  windowSize: windowSize,
                  name: "Sign Up",
                  onPress: () async {
                    if (inputValidation()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );

                        UtilFunctions.navigator(context, Home());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          AwesomDialoBox(context, 'Error...!',
                                  "The password provided is too weak..............")
                              .show();
                        } else if (e.code == 'email-already-in-use') {
                          AwesomDialoBox(context, "Error...!",
                                  "The account already exists for that email.")
                              .show();
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      AwesomDialoBox(context, "Error...!",
                              "Please check your input details.")
                          .show();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Have Existing an account?",
                      style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                        text: "  Login",
                        style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            UtilFunctions.goBack(context, LoginPageScreen());
                          }),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _password.text.isEmpty ||
        _phone.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_phone.text.length != 10) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }
}
