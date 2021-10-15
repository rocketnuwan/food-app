import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';

class ChooseLocationSection extends StatelessWidget {
  const ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(           
            children: [
              CustomSVG(image: "location.svg",),
              SizedBox(width: 13,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Home"),
                  CustomText(text: "242 ST Marks Eve, Finland",fontSize: 14,)
                ],
              ),
            ],
          ),
          CustomSVG(image: "settings.svg",),
        ],
      ),
    );
  }
}