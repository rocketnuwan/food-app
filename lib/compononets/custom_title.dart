import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomText(text: title,fontSize: 18, fontWeight: FontWeight.w500,),
    );
  }
}