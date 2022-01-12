import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/compononets/app_bar_button.dart';
import 'package:food_app/compononets/custom_image.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_title.dart';
import 'package:food_app/compononets/product_cart.dart';
import 'package:food_app/screens/main_screens/restauent_details_screen/restaurent_catagary_section.dart';
import 'package:food_app/screens/main_screens/restaurrent_menu/restaurent_menu.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';

class RestaurentDetailsScreen extends StatefulWidget {
  const RestaurentDetailsScreen({Key? key}) : super(key: key);

  @override
  _RestaurentDetailsScreenState createState() =>
      _RestaurentDetailsScreenState();
}

class _RestaurentDetailsScreenState extends State<RestaurentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              UpperSection(),
              RestaurentDetailsSection(),
              SizedBox(
                height: 22,
              ),
              CustomTitle(title: "Westway Food Menu"),
              SizedBox(
                height: 22,
              ),
              ResCatagorySection(),
              BestProductsSection(),
              GestureDetector(
                onTap: () {
                  UtilFunctions.navigator(context, RestaurentMenu());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "see our menu",
                        color: korange,
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BestProductsSection extends StatelessWidget {
  const BestProductsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 23, bottom: 10),
            child: CustomTitle(
              title: "Best Products",
            ),
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCart();
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}

class ResCategoryTile extends StatefulWidget {
  const ResCategoryTile(
      {Key? key, required this.catogeryName, required this.svgName})
      : super(key: key);

  final String svgName;
  final String catogeryName;

  @override
  State<ResCategoryTile> createState() => _ResCategoryTileState();
}

class _ResCategoryTileState extends State<ResCategoryTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        splashColor: mainBGcolor,
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 35,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: isSelected ? korange : kwhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CustomText(
                  text: widget.catogeryName,
                  fontSize: 13,
                  color: isSelected ? kwhite : greyColor,
                  alignment: Alignment.center,
                )),
          ],
        ),
      ),
    );
  }
}

class RestaurentDetailsSection extends StatelessWidget {
  const RestaurentDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "Westway",
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryColor,
                            size: 15,
                          ),
                          CustomText(
                            text: "4.6 ",
                            fontSize: 12,
                            padding: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: " •",
                            fontSize: 12,
                            color: greyColor,
                            padding: 3,
                          ),
                          Icon(
                            Icons.timer,
                            color: greyColor,
                            size: 15,
                          ),
                          CustomText(
                            text: "15 min",
                            fontSize: 12,
                            color: greyColor,
                            padding: 3,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              CustomText(
                text: "More info",
                fontSize: 14,
                color: korange,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            textAlign: TextAlign.justify,
            text:
                "Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health, feel good, and have energy.",
            fontSize: 15,
            color: greyColor,
          )
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
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
              width: UtilFunctions.windoSize(context).width,
              height: 300,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                  child: CustomNetworkImage(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"))),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    ontap: () {},
                  ),
                  Row(
                    children: [
                      AppBarButton(
                        ontap: () {},
                        iconName: "res_hart.svg",
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AppBarButton(
                        ontap: () {},
                        iconName: "res_cart.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
