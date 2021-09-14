import 'package:flutter/material.dart';

class UtilFunctions {
  //navigation function
  static void navigator(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  //go back function
  static void goBack(BuildContext context, Widget widget) {
    Navigator.of(context).pop();
  }

  //get window size
  static Size windoSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size;
  }
}
