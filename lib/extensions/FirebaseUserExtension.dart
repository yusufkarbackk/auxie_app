import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/User.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser(
          {String name = "No Name", String phoneNumber = "No Phone Number"}) =>
      User(this.uid, this.email, name: name, phoneNumber: phoneNumber);
}
