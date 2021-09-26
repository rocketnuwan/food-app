import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AwesomeDialog AwesomDialoBox(
  BuildContext context,
  final _title,
  final _desc,
) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    title: _title,
    desc: _desc,
    btnCancelOnPress: () {},

    // btnOkOnPress: () {},
  );
}
