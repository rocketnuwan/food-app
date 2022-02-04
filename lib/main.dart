import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/auth/login_provider.dart';
import 'package:food_app/providers/auth/registration_provider.dart';
import 'package:food_app/providers/home/category_provider.dart';
import 'package:food_app/providers/home/reasturent_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/main_screens/cart_sceen/cart_screen.dart';
import 'package:food_app/screens/main_screens/main_screen.dart';
import 'package:food_app/screens/main_screens/profile_screen/profile_sereen.dart';
import 'package:food_app/screens/main_screens/tracking_screens/traking_screens.dart';
import 'package:food_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReasturentProvider(),
        ),
      ],
      child: Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Delivary App",
      home: SplashScreen(),
      //home: MainScreen(),
      //home: CartScreen(),
      //home: TrackingScreen(),
      //home: ProfileScreen(),

      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
    );
  }
}
