import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_image.dart';
import 'package:food_app/screens/main_screens/home_screen/widgets/nearest_restaurent_section.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    this.isOffer=false,
    this.width=120,
    this.height=120,
  }) : super(key: key);

  final bool isOffer;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            CustomNetworkImage(
              url: "https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg",
            ),
            isOffer ? OfferTag() : SizedBox()
          ],
        )),
    );
  }
}