import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({Key? key,
    this.head1,
    this.head2,this.widget,
    }): super(key: key);

  final String? head1;
  final String? head2;
  
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
            Image.asset(
            Constants.imageAsset("header.png"),
          ),
          widget == null ?
          Container(
            padding: EdgeInsets.only(top: 65),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    head1 ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: primaryFontColor,
                    ),
                  ),
                  Text(
                    head2 ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryFontColor,
                    ),
                  ),
                ],
              ),
            ),
          )
          :widget!,
        ],
      ),
    );
  }
}
