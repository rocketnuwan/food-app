import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_lorder.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/providers/auth/login_provider.dart';
import 'package:food_app/screens/login_screen/forgot_password_screen.dart';
import 'package:food_app/screens/login_screen/registration_page_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  Future<bool> initBackButton() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
        body: FadeInLeft(
          duration: Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Container(
              width: windowSize.width,
              child: Column(
                children: [
                  Header(head1: "Login", head2: "Access account"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Constants.iconAsset("google.png"),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Constants.iconAsset("facebook.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "or Login with Email",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            CustomText(text: "Email"),
                            SizedBox(
                              height: 6,
                            ),
                            CustomTextFeild(
                              hint: "Sample@email.com",
                              controller: value.emailController,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            CustomText(text: "Password"),
                            SizedBox(
                              height: 6,
                            ),
                            TextField(
                              controller: value.passwordController,
                              style: TextStyle(fontSize: 16, letterSpacing: 1),
                              obscureText: value.isOasswordVisible,
                              decoration: InputDecoration(
                                fillColor: kwhite,
                                filled: true,
                                hintText: "••••••",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                                suffixIcon: IconButton(
                                    splashColor: primaryColor,
                                    splashRadius: 40,
                                    onPressed: () {
                                      value.changePasswordVistibale();
                                    },
                                    icon: Icon(
                                      value.isOasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: greyColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    UtilFunctions.navigator(
                                        context, ForgotPassword());
                                  },
                                  child: Text("Forgot your password ?",
                                      style: TextStyle(
                                          fontSize: 14, color: greyColor))),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                        islording: value.isLording,
                        windowSize: windowSize,
                        name: "Sign In",
                        onPress: () async {
                          value.startLogin(context);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Don’t have an account?",
                        style: GoogleFonts.poppins(
                          color: greyColor,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                          text: " Register",
                          style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              UtilFunctions.navigator(
                                  context, RegistrationPageScreen());
                            }),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
