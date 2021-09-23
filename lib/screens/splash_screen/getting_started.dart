import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/login_screen/login_page_screen.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  CarouselController carouselController = CarouselController();
  List<Widget> list = [
    SliderItem(
      img: "popcorn.png",
      text1: "Choose A Tasty Dish",
      text2: "Order anything you want from your\n Favorite restaurant.",
    ),
    SliderItem(
      img: "money.png",
      text1: "Easy Payment",
      text2:
          "Payment made easy through debit\n card, credit card  & more ways to pay\n for your food.",
    ),
    SliderItem(
      img: "restaurant.png",
      text1: "Enjoy the Taste!",
      text2:
          "Healthy eating means eating a variety\n of foods that give you the nutrients you\n need to maintain your health.",
    ),
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: windowSize.width,
          height: windowSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: windowSize.height / 2,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                carouselController: carouselController,
                items: list.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          children: [i],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key ? primaryColor : greyColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
              BottomSection(
                ontap: () => carouselController.nextPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String img;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Constants.imageAsset(img)),
        SizedBox(
          height: 37,
        ),
        Text(text1, style: TextStyle(fontSize: 22)),
        SizedBox(
          height: 6,
        ),
        Text(text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: greyColor,
              letterSpacing: 1,
              wordSpacing: 2,
            )),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            width: windowSize.width,
            child: Image.asset(
              Constants.imageAsset("bottom.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 39,
            right: 43,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: ontap,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: kblack,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kwhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
                TextButton(
                  onPressed: () {
                    UtilFunctions.navigator(context, LoginPageScreen());
                  },
                  style: TextButton.styleFrom(primary: Color(0xffFF7000)),
                  child: Text(
                    "skip",
                    style: TextStyle(
                      color: kblack,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
