import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/utils/app_colors.dart';

class CustomLorder extends StatelessWidget {
  const CustomLorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: kblack,
      size: 60.0,
    );
  }
}