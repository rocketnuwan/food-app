import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_app/compononets/awesom_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ProductProvider extends ChangeNotifier {
  final ProductController _productController = ProductController();

  final ImagePicker _picker = ImagePicker();

  File _image = File("");

  bool _isLoging = false;
  final _productNameController = TextEditingController();
  final _reasIDController = TextEditingController();
  final _productPriceController = TextEditingController();

  TextEditingController get productPriceController => _productPriceController;
  TextEditingController get reasIDController => _reasIDController;
  TextEditingController get productNameController => _productNameController;

  File get image => _image;

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_productNameController.text.isEmpty ||
        _reasIDController.text.isEmpty ||
        _productPriceController.text.isEmpty ||
        _image.path == "" ||
        (double.tryParse(_productPriceController.text) == null)) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }

  Future<void> addProduct(BuildContext context) async {
    try {
      setLording(true);

      if (inputValidation()) {
        await _productController.saveProductData(
            _productNameController.text,
            _image,
            double.parse(_productPriceController.text),
            _reasIDController.text);
        CustomAwesomDialog().dialogBox(context, "SuccesFull...!",
            "Product added successfull.", DialogType.SUCCES);
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

  //get is lording
  bool get isLording => _isLoging;

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
