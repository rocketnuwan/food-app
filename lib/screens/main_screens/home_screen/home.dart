import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/compononets/custom_title.dart';
import 'package:food_app/screens/main_screens/home_screen/widgets/category_section.dart';
import 'package:food_app/screens/main_screens/home_screen/widgets/choose_location_section.dart';
import 'package:food_app/screens/main_screens/home_screen/widgets/nearest_restaurent_section.dart';
import 'package:food_app/utils/app_colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _search = TextEditingController();
    return FadeInLeft(
      child: Container(
        child: Column(
          children: [
            UperSection(search: _search),
            BottomSection(),
          ],
        ),
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(child: CategorySection(),),
            SizedBox(height: 20,),
            CustomTitle(title: "Nearest Restaurents",),
            SizedBox(height: 11,),
            NearestRestaurentSection(),
            SizedBox(height: 26,),
            CustomTitle(title: "Popular Restaurents",),
            SizedBox(height: 11,),
            NearestRestaurentSection(),
            SizedBox(height: 11,),
          ],
        ),
      ),
    );
  }
}

class UperSection extends StatelessWidget {
  const UperSection({
    Key? key,
    required TextEditingController search,
  }) : _search = search, super(key: key);

  final TextEditingController _search;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          widget: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 66),
            child: CustomTextFeild(
              hint: "Find your taste",
               controller: _search,
               widget: Icon(Icons.search,color: greyColor,),
               )
          ),
        ),
        ChooseLocationSection(),
        SizedBox(height: 20,)
      ],
    );
  }
}




