import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_image.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/utils/app_colors.dart';

class NearestRestaurentSection extends StatelessWidget {
  const NearestRestaurentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            RestaurentTile(isOffer: true,),
            RestaurentTile(),
            RestaurentTile(),
            RestaurentTile(),
          ],
        ),
      ),
    );
  }
}

class RestaurentTile extends StatelessWidget {
  const RestaurentTile({
    Key? key,
    this.isOffer=false
  }) : super(key: key);
  
  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(left: 30,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: "https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg",
                  ),
                  isOffer ? 
                  OfferTag() : SizedBox()
                ],
              )),
          ),
          SizedBox(height: 5,),
          CustomText(text: "Westway" ,fontSize: 16,padding: 2,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star,color: primaryColor,size: 15,),
                    CustomText(text: "4.6 ",fontSize: 12,padding: 1,),
                  ],
                ),
                Row(
                  
                  children: [
                    CustomText(text: " •",fontSize: 12, color: greyColor,padding: 3,),
                    Icon(Icons.timer,color: greyColor,size: 15,),
                    CustomText(text: "15 min",fontSize: 12, color: greyColor,padding: 3,)
                  ],
                ),
              ],
              
            ),
          )
        ],
      ),
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: 79,
        height: 28,
        decoration: BoxDecoration(
          color: korange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
            )
        ),
        child: CustomText(text: "50% 0ff", fontSize: 13,fontWeight: FontWeight.w700,color: kwhite,),
      ),
    );
  }
}