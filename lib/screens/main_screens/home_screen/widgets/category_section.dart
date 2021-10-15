import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/utils/app_colors.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            CategoryTile(catogeryName: "All",svgName: "food.svg",),
            CategoryTile(catogeryName: "Pizza",svgName: "pizza.svg",),
            CategoryTile(catogeryName: "Beverages",svgName: "drink.svg",),
            CategoryTile(catogeryName: "Asian",svgName: "rice-cracker.svg",),
            CategoryTile(catogeryName: "Pizza",svgName: "pizza.svg",),
            CategoryTile(catogeryName: "Beverages",svgName: "drink.svg",),
            CategoryTile(catogeryName: "Asian",svgName: "rice-cracker.svg",),
            
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    Key? key,
    required this.catogeryName,
    required this.svgName
  }) : super(key: key);

  final String svgName;
  final String catogeryName;

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        splashColor: mainBGcolor,
        onTap: (){
          setState(() {
            isSelected=!isSelected;
          });
        },
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                padding: EdgeInsets.all(17),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: isSelected ? korange : kwhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CustomSVG(image: widget.svgName,
                color: isSelected ? kwhite : greyColor,),
              ),
              SizedBox(height: 4,),
              CustomText(text: widget.catogeryName,fontSize: 13,)
            ],
          ),
        ),
      ),
    );
  }
}