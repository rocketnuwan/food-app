import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_app/utils/constants.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class ResController {
  //fireStore instance ctrate
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Geofiltterfire instance
  Geoflutterfire geo = Geoflutterfire();

  //create collection reference
  CollectionReference res = FirebaseFirestore.instance.collection('restaurent');

  Future<void> saveData(
    String resName,
    double lat,
    double lng,
    File img,
    String about,
    String address,
  ) async {
    UploadTask? task = uploadFile(img);
    final snapshot = await task!.whenComplete(() {});
    final downlodUrl = await snapshot.ref.getDownloadURL();
    //Logger().i(downlodUrl);

    //get document id auto genarated
    String docId = res.doc().id;

    GeoFirePoint point = geo.point(latitude: lat, longitude: lng);

    await res.doc(docId).set({
      'resId': docId,
      'resname': resName,
      'about': about, //Constants.DUMMY_DESC,
      'averagerate': 0.0,
      'position': point.data,
      'img': downlodUrl,
      'address': address,
    });
  }

  // uplod image to db
  UploadTask? uploadFile(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'resImages/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
