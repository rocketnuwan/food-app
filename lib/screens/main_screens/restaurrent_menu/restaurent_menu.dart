import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/compononets/app_bar_button.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_title.dart';
import 'package:food_app/compononets/product_cart.dart';
import 'package:food_app/screens/main_screens/restauent_details_screen/restaurent_catagary_section.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';

class RestaurentMenu extends StatefulWidget {
  const RestaurentMenu({Key? key}) : super(key: key);

  @override
  _RestaurentMenuState createState() => _RestaurentMenuState();
}

class _RestaurentMenuState extends State<RestaurentMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(),
            SizedBox(
              height: 22,
            ),
            ResCatagorySection(),
            BestSellersSection(),
            SizedBox(
              height: 30,
            ),
            FooterSection(),
          ],
        ),
      ),
    ));
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 73,
      width: UtilFunctions.windoSize(context).width,
      alignment: Alignment.center,
      color: kgreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textAlign: TextAlign.center,
                text: "3 items",
                color: kwhite,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Row(
                children: [
                  CustomText(
                    text: "View Cart",
                    textAlign: TextAlign.center,
                    color: kwhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kwhite24,
                        borderRadius: BorderRadius.circular(12)),
                    child: CustomText(
                      text: "\$20.49",
                      textAlign: TextAlign.center,
                      color: kwhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 23, bottom: 10),
            child: CustomTitle(
              title: "Best Sellers",
            ),
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCart();
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: AppBarButton(ontap: () {
            UtilFunctions.goBack(
              context,
            );
          }),
        ),
        Column(
          children: [
            CustomText(
              text: "Westway",
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
            CustomText(
              text: "Menu",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: kblack,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: AppBarButton(
            ontap: () {},
            iconName: "settings.svg",
          ),
        ),
      ],
    );
  }
}
