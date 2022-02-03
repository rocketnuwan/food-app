import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/objects.dart';

import 'package:logger/logger.dart';

class DatabaseController {
  //fireStore instance ctrate
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //save user infoation
  Future<void> saveUserDate(
      String name, String email, String phone, String password, String uid) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set(
          {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'uid': uid,
            'address': null,
          },
          SetOptions(merge: true),
        )
        .then(
            (value) => print("'full_name' & 'age' merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  //update user address
  Future<void> updateAddress(UserModel user) async {
    return users
        .doc(user.uid)
        .set(
          user.toJson(),
        )
        .then((value) => print("address update sussessful!"))
        .catchError((error) => print("Failed to update: $error"));
  }

  //getUser data
  Future<UserModel?> getUserData(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());

      UserModel userModel =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);

      //Logger().d(userModel.toString());
      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
