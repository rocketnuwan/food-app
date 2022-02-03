import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_lorder.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.windowSize,
      required this.name,
      required this.onPress,
      this.buttonColor = primaryColor,
      this.buttonMargin = 25,
      this.islording = false})
      : super(key: key);

  final Size windowSize;
  final name;
  final Function() onPress;
  final Color buttonColor;
  final double buttonMargin;
  final bool islording;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: windowSize.width,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: buttonMargin),
      child: ElevatedButton(
        onPressed: islording ? null : onPress,
        child: islording
            ? CustomLorder()
            : Text(
                name,
                style: GoogleFonts.poppins(
                  color: primaryFontColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
        style: ElevatedButton.styleFrom(
            primary: islording ? buttonColor.withOpacity(0.6) : buttonColor,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
