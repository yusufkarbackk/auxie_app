import 'package:auxie_app/services/UserServices.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../extensions/FirebaseUserExtension.dart';
import '../models/User.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future signInAnonymous() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> signUp(String userName, String email, String phoneNumber,
      String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser =
          result.user.convertToUser(name: userName, phoneNumber: phoneNumber);

      await UserServices.updateUser(firebaseUser);
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<auth.User> get firbaseUserStream => _auth.authStateChanges();
}
