import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/constants.dart';

class CustomSVG extends StatelessWidget {
  const CustomSVG({
    Key? key,
    required this.image,
    this.color,
  }) : super(key: key);

  final Color? color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Constants.iconAsset(image),color: color,);
  }
}