import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurentModel {
  late String resId;
  late String resname;
  late String about;
  late double averagerate;
  late GeoPoint position;
  late String img;

  RestaurentModel({
    required this.resId,
    required this.about,
    required this.resname,
    required this.averagerate,
    required this.position,
    required this.img,
  });

  RestaurentModel.fromJson(Map map) {
    resId = map['resId'];
    resname = map['resname'];
    about = map['about'];
    averagerate = map['averagerate'];
    position = map['position']['geopoint'];
    img = map['img'];
  }
}
