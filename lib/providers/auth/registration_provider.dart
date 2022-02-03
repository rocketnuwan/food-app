import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
  bool _passwordVisible = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  bool _isLoging = false;

//get password hidden
  bool get isPasswordVisible => _passwordVisible;

//get is lording
  bool get isLording => _isLoging;

//gatters
  TextEditingController get emailController => _email;
  TextEditingController get passwordController => _password;
  TextEditingController get nameController => _name;
  TextEditingController get phoneController => _phone;

  //change passwordvisibale
  void changePasswordVistibale() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _password.text.isEmpty ||
        _phone.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_phone.text.length != 10) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }

  Future<void> srartRegister(BuildContext context) async {
    try {
      setLording(true);

      if (inputValidation()) {
        await AuthController().registrationUser(
          context,
          _email.text,
          _password.text,
          _name.text,
          _phone.text,
        );
      } else {
        CustomAwesomDialog().dialogBox(
          context,
          "Error...!",
          "Please check your input details.",
          DialogType.ERROR,
        );
      }

      setLording(false);
    } catch (e) {
      setLording(false);
      Logger().e(e);
    }
  }

  //change lordingState
  void setLording([bool val = false]) {
    _isLoging = val;
    notifyListeners();
  }
}