import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_title.dart';
import 'package:food_app/screens/main_screens/restauent_details_screen/restaurent_details_screen.dart';

class ResCatagorySection extends StatelessWidget {
  const ResCatagorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22,
        ),
        CustomTitle(title: "Westway Food Menu"),
        SizedBox(
          height: 22,
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ResCategoryTile(
                  catogeryName: "All items",
                  svgName: "food.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Veg",
                  svgName: "pizza.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Non-Veg",
                  svgName: "drink.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Beverages",
                  svgName: "rice-cracker.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Pizza",
                  svgName: "pizza.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Beverages",
                  svgName: "drink.svg",
                ),
                ResCategoryTile(
                  catogeryName: "Asian",
                  svgName: "rice-cracker.svg",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
