import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(User user) async {
    _userCollection.doc(user.id).set({
      "email": user.email,
      "name": user.name,
      "phoneNumber": user.phoneNumber,
    });
  }
}
