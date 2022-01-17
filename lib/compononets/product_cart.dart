import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app/compononets/custom_dialog_box.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/image_tole.dart';
import 'package:food_app/utils/app_colors.dart';

class ProductCart extends StatelessWidget {
  ProductCart({
    Key? key,
    this.margin = 30,
  }) : super(key: key);
  final double margin;

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
        horizontal: margin,
      ),
      padding: EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageTile(
                isOffer: true,
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
                    text: "Vegitable Salad",
                    fontSize: 14,
                  ),
                  CustomText(
                    text: "In Pizza Mania",
                    fontSize: 12,
                    color: greyColor,
                  ),
                  CustomText(
                    text: "Price. 152.00",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ElasticIn(
                          child: CustomDialogBox(
                        iconNAme: "cartBig.svg",
                        text1: "Sucessfully",
                        text2: "added to cart",
                        btnname: "Check out now",
                        btnOnTap: () {},
                      ));
                    });
              },
              child: Icon(
                Icons.add,
                color: greyColor,
              ))
        ],
      ),
    );
  }
}
