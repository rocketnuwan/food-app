import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/res_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ReasturentProvider extends ChangeNotifier {
  final ResController _resController = ResController();

  final ImagePicker _picker = ImagePicker();

  String _resname = "";
  String _about = "";
  String _address = "";
  double _lat = 0;
  double _lng = 0;
  File _image = File("");

  bool _isLoging = false;
  final _resnameController = TextEditingController();
  final _aboutController = TextEditingController();
  final _addressController = TextEditingController();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  TextEditingController get addressController => _addressController;
  TextEditingController get aboutController => _aboutController;
  TextEditingController get nameController => _resnameController;
  TextEditingController get latController => _latController;
  TextEditingController get lngController => _lngController;
  File get image => _image;

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_resnameController.text.isEmpty ||
        _aboutController.text.isEmpty ||
        _address == "" ||
        _lat == 0 ||
        _lng == 0 ||
        _image.path == "") {
      isValid = false;
    } else {
      setother();
      isValid = true;
    }

    return isValid;
  }

  Future<void> addReasturent(BuildContext context) async {
    try {
      setLording(true);

      if (inputValidation()) {
        await _resController.saveData(
            _resname, _lng, _lng, _image, _about, _address);
        CustomAwesomDialog().dialogBox(context, "SuccesFull...!",
            "Resturent added successfull.", DialogType.SUCCES);
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

  Future<void> setother() async {
    _resname = _resnameController.text;
    _about = _aboutController.text;

    notifyListeners();
  }

  void setAddress() {
    if (!(_addressController.text.isEmpty ||
        _latController.text.isEmpty ||
        _lngController.text.isEmpty)) {
      if ((double.tryParse(_latController.text) != null) &&
          (double.tryParse(_lngController.text) != null)) {
        _address = addressController.text;
        _lat = double.parse(_latController.text);
        _lng = double.parse(lngController.text);
      }
    }

    notifyListeners();
  }

  //change lordingState
  void setLording([bool val = false]) {
    _isLoging = val;
    notifyListeners();
  }

  //get is lording
  bool get isLording => _isLoging;

  String get address => _address != "" ? _address : "select Resturent location";

  Future<void> selectImage() async {
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _image = File(image.path);
        notifyListeners();
      } else {
        Logger().i("No immage pick");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
