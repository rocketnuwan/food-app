import 'package:flutter/material.dart';
import 'package:food_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Delivary App",
      home: SplashScreen(),
    );
  }
}
