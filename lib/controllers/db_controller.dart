import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  //fireStore instance ctrate
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //save user infoation
  Future<void> saveUserDate(
      String name, String email, String phone, String password,String uid) {
    // Call the user's CollectionReference to add a new user
    return users.doc(uid)
    .set({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'uid': uid,
      },
      SetOptions(merge: true),
    )
    .then(
      (value) => print("'full_name' & 'age' merged with existing data!")
    )
    .catchError((error) => print("Failed to merge data: $error"));
  }
}
