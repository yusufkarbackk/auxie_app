import 'package:auxie_app/services/UserServices.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/User.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser(
          {String name = "No Name", String phoneNumber = "No Phone Number"}) =>
      User(this.uid, this.email,
          name: name,
          phoneNumber: phoneNumber); //inserting signup data into user model

  Future<User> fromFireStore() async => await UserServices.getUser(this
      .uid); //call this getUser method ftom UserServices to retrieve the user data
}
