import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/image_tole.dart';
import 'package:food_app/utils/app_colors.dart';

class PCartItems extends StatelessWidget {
  const PCartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kwhite,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: Colors.black26,
            )
          ]),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageTile(
            isOffer: false,
            width: 90,
            height: 90,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Burger with some",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Container(
                width: 125,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xff8f8fa),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      iconSize: 10,
                    ),
                    CustomText(
                      text: "1",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                      iconSize: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
                iconSize: 10,
              ),
              CustomText(
                text: "152",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
