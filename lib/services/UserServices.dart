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
    }); // a function to insert or update user data
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(id, snapshot.data()["email"],
        name: snapshot.data()["name"],
        phoneNumber:
            snapshot.data()["phoneNumber"]); //a function to retrieve user data
  }
}
