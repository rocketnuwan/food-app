import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/utils/app_colors.dart';

class CustomLorder extends StatelessWidget {
  const CustomLorder({
    Key? key,
    this.lcolor=greyColor
  }) : super(key: key);

  final Color lcolor;

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: lcolor,
      size: 60.0,
    );
  }
}