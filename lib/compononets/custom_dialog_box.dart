import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/utils/app_colors.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox(
      {Key? key,
      required this.iconNAme,
      required this.text1,
      required this.text2,
      required this.btnname,
      required this.btnOnTap})
      : super(key: key);

  final String iconNAme;
  final String text1;
  final String text2;
  final String btnname;
  final Function() btnOnTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSVG(image: iconNAme),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kgreen,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: text2,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kgreen,
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: btnOnTap,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 172,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: btnname,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
