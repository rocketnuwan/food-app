import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_text.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({ Key? key }) : super(key: key);

  @override
  _SerchScreenState createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        child: CustomText(text: "Search Screen",fontSize: 25,alignment: Alignment.center,),
      ),
    );
  }
}