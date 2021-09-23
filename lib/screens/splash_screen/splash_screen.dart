import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/splash_screen/getting_started.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      UtilFunctions.navigator(context, GettingStarted());
    });
  }

  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: Container(
        width: windowSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.imageAsset('food.png')),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "No waiting for food",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff838383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
