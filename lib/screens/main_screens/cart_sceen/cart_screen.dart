import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/compononets/app_bar_button.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/product_cart.dart';
import 'package:food_app/screens/main_screens/cart_sceen/cart_item.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeInLeft(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpperSection(),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 22, right: 22),
                  width: double.infinity,
                  height: 111,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: korange,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 23,
                        left: 23,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: kwhite,
                        ),
                      ),
                      Positioned(
                        top: 23,
                        left: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Deliverd to",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kwhite,
                            ),
                            CustomText(
                              text: "242 ST Marks Ewe,\n Inland",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kwhite,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 45,
                        right: 17,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: kwhite,
                        ),
                      ),
                    ],
                  ),
                ),
                CartItems(),
                PromoCode(),
                FooterSection(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class PromoCode extends StatelessWidget {
  const PromoCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: kwhite,
                hintText: "PROMO CODE",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: UtilFunctions.windoSize(context).width,
          child: Image.asset(
            Constants.imageAsset("footer2.png"),
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Item total",
                      fontSize: 14,
                    ),
                    CustomText(
                      text: "\$20.49",
                      fontSize: 14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Discount",
                      fontSize: 14,
                    ),
                    CustomText(
                      text: "-\$10",
                      fontSize: 14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Tax",
                      fontSize: 14,
                    ),
                    CustomText(
                      text: "\$2",
                      fontSize: 14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Total",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "\$12.49",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    windowSize: UtilFunctions.windoSize(context),
                    name: "Continue",
                    buttonColor: kwhite,
                    buttonMargin: 9,
                    onPress: () {}),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PCartItems();
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 3),
        ),
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
        CustomText(
          text: "Cart",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: primaryFontColor,
        ),
        SizedBox(
          width: 80,
        )
      ],
    );
  }
}
