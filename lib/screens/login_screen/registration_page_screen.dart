import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_lorder.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/providers/auth/registration_provider.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({Key? key}) : super(key: key);

  @override
  _RegistrationPageScreenState createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeInRight(
          duration: Duration(seconds: 1),
          child: Consumer<RegistrationProvider>(
            builder: (context, value, child) {
              return Container(
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
                          CustomText(text: "Name"),
                          SizedBox(
                            height: 6,
                          ),
                          CustomTextFeild(
                            hint: "Rocket Nuwan",
                            controller: value.nameController,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          CustomText(text: "Email"),
                          SizedBox(
                            height: 6,
                          ),
                          CustomTextFeild(
                            hint: "Sample@email.com",
                            controller: value.emailController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(text: "Phone"),
                          SizedBox(
                            height: 6,
                          ),
                          CustomTextFeild(
                            hint: "0771234567",
                            controller: value.phoneController,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          CustomText(text: "Password"),
                          SizedBox(
                            height: 6,
                          ),
                          TextField(
                            controller: value.passwordController,
                            style: TextStyle(fontSize: 16, letterSpacing: 1),
                            obscureText: value.isPasswordVisible,
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
                                      value.changePasswordVistibale();
                                    },
                                    icon: Icon(
                                      value.isPasswordVisible
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
                    value.isLording
                        ? CustomLorder()
                        : CustomButton(
                            windowSize: windowSize,
                            name: "Sign Up",
                            onPress: () async {
                              value.srartRegister(context);
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
                                UtilFunctions.goBack(
                                  context,
                                );
                              }),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
