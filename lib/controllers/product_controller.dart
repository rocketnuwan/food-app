import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class ProductController {
  //fireStore instance ctrate
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create collection reference
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> saveProductData(
    String productName,
    File img,
    double productprice,
    String resId,
  ) async {
    UploadTask? task = uploadFile(img);
    final snapshot = await task!.whenComplete(() {});
    final downlodUrl = await snapshot.ref.getDownloadURL();
    //Logger().i(downlodUrl);

    //get document id auto genarated
    String docId = products.doc().id;

    await products.doc(docId).set({
      'productId': docId,
      'productName': productName,
      'productprice': productprice,
      'averagerate': 0.0,
      'img': downlodUrl,
      'resId': resId,
    });
  }

  // uplod image to db
  UploadTask? uploadFile(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'productImages/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
