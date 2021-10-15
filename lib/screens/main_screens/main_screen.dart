import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/screens/main_screens/cart_sceen/cart_screen.dart';
import 'package:food_app/screens/main_screens/home_screen/home.dart';
import 'package:food_app/screens/main_screens/profile_screen/profile_sereen.dart';
import 'package:food_app/screens/main_screens/search_screen/search_screen.dart';
import 'package:food_app/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
  List<Widget> _screens = [
    Home(),
    SerchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBGcolor,
      bottomNavigationBar: Container(
        height: 90,
        color: kwhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: "home.svg",
              isSelected: _currentIndex==0,
              ontap: (){
                setState(() {
                  _currentIndex=0;
                });
              },
            ),
            BottomNavTile(
              icon: "search.svg",
              isSelected: _currentIndex==1,
              ontap: (){
                setState(() {
                  _currentIndex=1;
                });
              },
            ),
            BottomNavTile(
              icon: "cart.svg",
              isSelected: _currentIndex==2,
              ontap: (){
                setState(() {
                  _currentIndex=2;
                });
              },
            ),
            BottomNavTile(
              icon: "profile.svg",
              isSelected: _currentIndex==3,
              ontap: (){
                setState(() {
                  _currentIndex=3;
                });
              },
            ),
          ],
        ),
      ),
      body: _screens.elementAt(_currentIndex),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
  }) : super(key: key);

  final String icon;
  final bool isSelected;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: 50,
        height: 50,
        child: CustomSVG(image: icon,color: isSelected?kwhite:greyColor,),
          decoration: BoxDecoration(
            color: isSelected? primaryColor:kwhite,
            borderRadius: BorderRadius.circular(15)
          ),
        )
        );
  }
}