import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 15,
    this.color = kblack,
    this.fontWeight,
    this.padding = 11,
    this.alignment = Alignment.topLeft,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final double padding;
  final Alignment alignment;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Container(
        alignment: alignment,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
