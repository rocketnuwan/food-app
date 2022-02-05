import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/admin/add_product.dart';
import 'package:food_app/screens/admin/add_reasturent.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return FadeInLeft(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Prafile Screen",
              fontSize: 25,
              alignment: Alignment.center,
            ),
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    CustomText(
                      text: value.usermodel.name,
                      fontSize: 25,
                      alignment: Alignment.center,
                    ),
                    CustomText(
                      text: value.usermodel.email,
                      fontSize: 25,
                      alignment: Alignment.center,
                    ),
                    CustomText(
                      text: value.usermodel.uid,
                      fontSize: 25,
                      alignment: Alignment.center,
                    ),
                    CustomText(
                      text: value.usermodel.phoneNo,
                      fontSize: 25,
                      alignment: Alignment.center,
                    ),
                  ],
                );
              },
            ),
            CustomButton(
                windowSize: windowSize,
                name: "Logout",
                onPress: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .logOut(context);
                }),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                buttonColor: Colors.brown,
                windowSize: windowSize,
                name: "Add Reasturent",
                onPress: () {
                  UtilFunctions.navigator(context, AddReasturent());
                }),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                buttonColor: Colors.deepPurple,
                windowSize: windowSize,
                name: "Add Products",
                onPress: () {
                  UtilFunctions.navigator(context, AddProduct());
                })
          ],
        ),
      ),
    );
  }
}
