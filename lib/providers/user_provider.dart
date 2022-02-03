import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/db_controller.dart';
import 'package:food_app/models/objects.dart';
import 'package:food_app/screens/login_screen/login_page_screen.dart';
import 'package:food_app/screens/main_screens/main_screen.dart';
import 'package:food_app/screens/splash_screen/getting_started.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  //database controoler object
  DatabaseController _databaseController = DatabaseController();

  //usermaodel
  late UserModel _userModel;
//get user data
  UserModel get usermodel => _userModel;

//check whether the user alrady sinin
  void initilizeUser(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigator(context, GettingStarted());
      } else {
        Logger().i('User is signed in!');

        await fetuchSingleUser(user.uid);

        UtilFunctions.navigator(context, MainScreen());
      }
    });
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    UtilFunctions.pushRemoveNavigator(context, LoginPageScreen());
  }

  Future<void> fetuchSingleUser(String uid) async {
    _userModel = (await _databaseController.getUserData(uid))!;
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////
  //address model
  final AddressModel _addressModel = AddressModel(
      addressString: "242 ST Marks Eve, Finland", latitude: 0, longitude: 0);

  /*
      //set deliveryaddress
      void setAddress(String result){
        _addressModel.addressString=result.formattedAddress;
        _addressModel.latitude=result.geomerty.location.lat;
        _addressModel.longitude=result.geomerty.location.lng;
        notifyListeners()
      }
      */

  // String get address => _addressModel.addressString != ""
  //     ? _addressModel.addressString
  //     : "select your location";
  //////////////////////////////////////////////////////////////////////////////
  ///
  ///
  var _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;

  void setAddress() {
    //update databse address
    _userModel.address = _addressController.text;
    Logger().w(_userModel.toJson());
    _databaseController.updateAddress(_userModel);
    notifyListeners();
  }

  String get address => _userModel.address != null
      ? _userModel.address.toString()
      : "select your location";
}
