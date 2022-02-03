import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    Key? key,
    required this.hint,
    required this.controller,
    this.widget,
    this.align = TextAlign.start,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final Widget? widget;
  final TextAlign align;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: align,
      controller: controller,
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        prefixIcon: widget,
        fillColor: kwhite,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
