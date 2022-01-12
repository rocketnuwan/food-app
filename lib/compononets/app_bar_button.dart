import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/utils/app_colors.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    this.iconName = "res_back_arrow.svg",
    required this.ontap,
  }) : super(key: key);

  final String iconName;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 48,
        height: 48,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),                    ),
        child: CustomSVG(
          image: iconName,)
          ,),
    );
  }
}